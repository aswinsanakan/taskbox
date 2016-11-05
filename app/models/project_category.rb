class ProjectCategory < ActiveRecord::Base
	belongs_to :Project
	belongs_to :category 

end
