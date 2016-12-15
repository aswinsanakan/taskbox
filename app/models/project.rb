class Project < ActiveRecord::Base

	has_many :tasks
	has_many :project_categories
	has_many :categories, through: :project_categories

	belongs_to :client
	belongs_to :user

	validates :name, presence: true
	# when arguments are passed for a method we use : before, and for options for the method we pass : after, the values for the options we pass : before
	validates_length_of :description, minimum: 10
	validates_presence_of :status
	#custom validations
	#this validation will only get invoked at the time of creating a new record, and not upddating
	#validate :check_status_on_create, on: :create 
	validate :start_date_one_week
	validate :client_unique_project #One client - 2 projects
	validates_uniqueness_of :name
	#validate :unique_projectname #Checck uniqueness of projectname

	def overdue_tasks
		self.tasks.where('is_completed = ? AND due_date > ?', false, Date.today)
	end

	def incomplete_tasks
		self.tasks.where('is_completed = ?', false)
	end

	def completed_tasks
		self.tasks.where('is_completed = ?', true)
	end

	def calc_completed
		return ((self.completed_tasks.size / self.tasks.size.to_f) * 100).round(2)
	end

	def calc_incomplete
		return ((self.incomplete_tasks.size / self.tasks.size.to_f) * 100).round(2)
	end

	def calc_overdue
		return ((self.overdue_tasks.size / self.tasks.size.to_f) * 100).round(2)
	end



	private

	def check_status_on_create
		if self.status !="new"
			errors.add(:status, " is not new")
		end
	end
	
	def start_date_one_week
		if !(self.start_date.nil?) && self.start_date > Date.today + 7.days
			errors.add(:start_date, " is greater than one week from today")
		end
	end

	def client_unique_project
		c = Project.where('client_id = ?', self.client_id).count
		if c >= 10
			errors.add(:client_id, "cannot have more than 2 projects")
		end
	end

end
