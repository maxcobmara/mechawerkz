class StaffPosition < ActiveRecord::Base
  has_ancestry
  
  #belong_to :document_binder,  :foreign_key => 'position.id', 'position.name'
  ## e.g Binder = Accounts, Staff Position = Accountant.
  ## read out loud : Accountant belongs to Accounts Binder. aik! orang bertuankan fail? tak logic
  ## :foreign_key => 'position.id' means database: position, field: id.  this doesnt exist.
  
  has_many :document_binders, foreign_key: 'owned_by'
  
  #note plural, so read out loud: Staff Position has many document binders. logic?
  #now with data.  Accountant has many document binders.
  #now if singular: Account has many document binder.  grammar?
  #note there is also has_one
  #e.g  Car belongs_to owner, owner has_one car. (tho owner may have many cars but allowed only one)

  end
