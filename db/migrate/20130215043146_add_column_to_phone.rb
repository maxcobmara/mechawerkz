class AddColumnToPhone < ActiveRecord::Migration
  def self.up
    add_column :phones, :addbook_id, :integer
  end

  def self.down
    remove_column :phones, :addbook_id
  end
end
