class ContactCompany < ActiveRecord::Base
  has_many :contact_mediums, :foreign_key => 'company_id' 
  accepts_nested_attributes_for :contact_mediums, allow_destroy: true
end
