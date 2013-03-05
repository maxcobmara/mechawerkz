class AddColumnToAddbooks < ActiveRecord::Migration
  def self.up
    add_column :addbooks, :contact_person, :string
  end

  def self.down
    remove_column :addbooks, :contact_person
  end
end
