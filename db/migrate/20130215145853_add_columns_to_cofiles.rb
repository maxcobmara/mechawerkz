class AddColumnsToCofiles < ActiveRecord::Migration
  def self.up
    add_column    :cofiles, :company, :integer
  	add_column    :cofiles, :remark,  :string
  end

  def self.down
    remove_column :cofiles, :company
  	remove_column :cofiles, :remark
  end
end
