class FixColumnToCofiles < ActiveRecord::Migration
  def self.up
    remove_column   :cofiles, :main_class
  	remove_column   :cofiles, :sub_class
  	add_column      :cofiles, :classification, :integer
  end

  def self.down
    remove_column   :cofiles, :classification
  	add_column      :cofiles, :main_class,:integer
  	add_column      :cofiles, :sub_class, :integer
  end
end
