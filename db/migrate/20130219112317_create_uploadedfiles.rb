class CreateUploadedfiles < ActiveRecord::Migration
  def self.up
    create_table :uploadedfiles do |t|
      t.string :name
      t.string :content_type
      t.binary :data

      t.timestamps
    end
  end

  def self.down
    drop_table :uploadedfiles
  end
end
