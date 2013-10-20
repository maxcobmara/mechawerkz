class ContactMedium < ActiveRecord::Base
  belongs_to :contact_company, :foreign_key => 'company_id'
  belongs_to :contact_person, :foreign_key => 'person_id' 
  belongs_to :staff
end
