class Phone < ActiveRecord::Base
  belongs_to :addbook

  PHONETYPE = [
           #  Displayed       stored in db
           [ "General line","1" ],
           [ "Hunting line","2" ],
           [ "Direct line","3" ],
           [ "Mobile","4" ],
           [ "Fax", "5" ]
    ]
  
end
