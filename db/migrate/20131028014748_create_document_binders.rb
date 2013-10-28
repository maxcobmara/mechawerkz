class CreateDocumentBinders < ActiveRecord::Migration
  def change
    create_table :document_binders do |t|
      t.string :code
      t.string :description
      t.string :volume
      t.integer :contact_company_id
      t.integer :owned_by
      t.integer :location_id

      t.timestamps
    end
  end
end
