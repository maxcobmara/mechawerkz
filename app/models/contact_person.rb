class ContactPerson < ActiveRecord::Base
  has_many :contact_mediums, :foreign_key => 'person_id' 
  has_many :document, :foreign_key => 'recieved_from'
  accepts_nested_attributes_for :contact_mediums, allow_destroy: true
  
  belongs_to :contact_company
end
