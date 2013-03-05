class FixColumnToPhone < ActiveRecord::Migration
  def self.up
    remove_column :phones, :phone_type
    add_column :phones, :phone_type, :string
  end

  def self.down
    add_column :phones, :phone_type, :integer
    remove_column :phones, :phone_type
  end
end
