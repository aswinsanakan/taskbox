class Client < ActiveRecord::Base
	
	acts_as_paranoid 
	
	has_many :projects
	belongs_to :user
	
	validates_presence_of :name, :email, :mobile
	validates_numericality_of :mobile
	validates_length_of :mobile, is: 10
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	validates_uniqueness_of :email

	def details
		"#{name} - #{company}"
	end

	def client_tasks
		@tasks = []
		self.projects.each do |project|
			project.tasks.each do |task|
				@tasks.push(task)
			end
		end
		@tasks
	end
end
