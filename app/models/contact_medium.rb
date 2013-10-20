class ContactMedium < ActiveRecord::Base
  belongs_to :contact_company
  belongs_to :contact_person
  belongs_to :staff
end
