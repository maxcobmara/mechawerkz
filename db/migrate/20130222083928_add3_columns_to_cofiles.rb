class Add3ColumnsToCofiles < ActiveRecord::Migration
  def self.up
    add_column    :cofiles, :cofile_code, :string
  	add_column    :cofiles, :main_class,  :integer
  	add_column    :cofiles, :sub_class,   :integer
  end

  def self.down
    remove_column    :cofiles, :cofile_code
  	remove_column    :cofiles, :main_class
  	remove_column    :cofiles, :sub_class
  end
end
