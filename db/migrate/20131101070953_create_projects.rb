class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :code
      t.string :name
      t.string :customer_ref
      t.integer :company_id
      t.date :start_at
      t.date :end_at
      t.decimal :value

      t.timestamps
    end
  end
end
