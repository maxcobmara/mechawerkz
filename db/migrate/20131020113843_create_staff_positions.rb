class CreateStaffPositions < ActiveRecord::Migration
  def change
    create_table :staff_positions do |t|
      t.string :code
      t.string :combo_code
      t.string :name
      t.string :unit
      t.text   :tasks_main
      t.text   :tasks_other
      t.string :ancestry
      t.integer :ancestry_depth
      t.boolean :is_acting
      t.integer :staff_grade_min
      t.integer :staff_id

      t.timestamps
    end
    add_index :staff_positions, [:code, :ancestry]
  end
end
