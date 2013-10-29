class StaffPosition < ActiveRecord::Base
  has_ancestry
  
  belong_to :document_binder,  :foreign_key => 'position.id', 'position.name'
  end
