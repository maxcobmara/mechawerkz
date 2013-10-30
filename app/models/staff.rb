class Staff < ActiveRecord::Base

has_many :staff_position, foreign_key: 'staff_id'
has_many :document, :foreign_key => 'filed_by'
has_many :document, :foreign_key => 'addressed_to'
end
