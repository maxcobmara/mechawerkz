class Addbook < ActiveRecord::Base
  has_many :suppliers,    :class_name => 'Asset', :foreign_key => 'supplier_id'
  has_many :manufacturers,:class_name => 'Asset', :foreign_key => 'manufacturer_id'
  has_many :books,                                :foreign_key => 'supplier_id'
  has_many :ptcourses,                            :foreign_key => 'provider_id'
  has_many :maintainers,  :class_name => 'Maint', :foreign_key => 'maintainer_id'
  
  #15Feb2013-subform for addbook 
  has_many :phones, :foreign_key => 'addbook_id', :dependent => :destroy
  accepts_nested_attributes_for :phones, :allow_destroy => true, :reject_if => lambda { |a| a[:phone_no].blank? }
  
  # start of-----7Feb2013 - add-in postcode
  attr_accessor :postcode
  
  before_save :save_my_vars
  
  def save_my_vars
    self.address = address.to_s + "//"+postcode.to_s
  end
  
  def postcode
    #@postcode 
    if @addbook
      @addbook.address.split("//").last
    else
      
      @postcode
    end
  end
  # end of-----7Feb2013 - add-in postcode
  
  def self.search(search)
    if search
      find(:all, :conditions => ['name ILIKE ?', "#{search}%"])
    else
      all
    end
  end
  
  
end
