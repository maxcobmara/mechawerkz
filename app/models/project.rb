class Project < ActiveRecord::Base
	has_many :bill, :foreign_key => 'project_id'
end
