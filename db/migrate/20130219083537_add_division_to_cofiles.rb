class AddDivisionToCofiles < ActiveRecord::Migration
  def self.up
    add_column :cofiles, :division, :integer
  end

  def self.down
    remove_column :cofiles, :division
  end
end
