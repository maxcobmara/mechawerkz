class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.integer :project_id
      t.integer :pay_to
      t.integer :document_id
      t.integer :category_id
      t.integer :company_id
      t.decimal :amount

      t.timestamps
    end
  end
end
