class DocumentBinder < ActiveRecord::Base
  
  #Your code commented out ~ delete comments when done
	#has_many :staff_position,  :foreign_key => 'position.id', 'position.name'
  
  ## Read out loud : Document Binder has many staff positions.  logic?
  
	#accepts_nested_attributes_for :staff_position, allow_destroy: true
  ## this is only required with nested forms i.e add many items in one form. we only have one drop down.
  
  belongs_to :staff_position, :foreign_key => 'owned_by'
  #read out loud: DocumentBinder belongs to Staff Position. logic?
	
end
