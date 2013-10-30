class Staff < ActiveRecord::Base

has_many :staff_position, foreign_key: 'staff_id'
end
