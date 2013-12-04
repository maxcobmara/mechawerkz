class Document < ActiveRecord::Base
	has_many :bill, :foreign_key => 'document_id'
	belongs_to :contact_person, :foreign_key => 'recieved_from'
	belongs_to :staff, :foreign_key => 'filed_by'
	belongs_to :staff, :foreign_key => 'addressed_to'
	
	
	end
