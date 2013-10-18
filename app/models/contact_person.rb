class ContactPerson < ActiveRecord::Base
 has_many :contact_medium_types
  accepts_nested_attributes_for :contact_medium_types, allow_destroy: true  
  end
