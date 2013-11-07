class Bill < ActiveRecord::Base
	belongs_to :project, :foreign_key => 'project_id'
	belongs_to :contact_company, :foreign_key => 'pay_to'
	belongs_to :document, :foreign_key => 'document_id' 
end
