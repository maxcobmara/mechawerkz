class DocumentBinder < ActiveRecord::Base
	has_many :staff_position,  :foreign_key => 'position.id', 'position.name'
	accepts_nested_attributes_for :staff_position, allow_destroy: true
	
end
