class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :ref_no
      t.string :title
      t.integer :project_id
      t.integer :document_category_id
      t.string :type
      t.date :document_date
      t.integer :recieved_from
      t.date :received_on
      t.integer :filed_by
      t.integer :addressed_to
      t.text :description
      t.integer :binder_id
      t.string :document_file_name
      t.string :document_content_type
      t.integer :document_file_size
      t.datetime :document_updated_at

      t.timestamps
    end
  end
end
