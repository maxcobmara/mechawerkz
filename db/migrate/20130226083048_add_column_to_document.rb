class AddColumnToDocument < ActiveRecord::Migration
  def self.up
    add_column :documents, :document_type, :integer
  end

  def self.down
    remove_column :documents, :document_type
  end
end
