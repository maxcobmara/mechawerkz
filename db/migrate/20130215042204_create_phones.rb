class CreatePhones < ActiveRecord::Migration
  def self.up
    create_table :phones do |t|
      t.integer :phone_type
      t.string :phone_no

      t.timestamps
    end
  end

  def self.down
    drop_table :phones
  end
end
