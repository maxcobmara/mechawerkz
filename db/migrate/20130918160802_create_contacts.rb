class CreateContacts < ActiveRecord::Migration

#unified migration for contacts/address book
  def change
    create_table :contact_people do |t|
      t.string  :name
      t.integer :company_id
      t.string  :position

      t.timestamps
    end
    
    create_table :contact_companies do |t|
      t.string :name
      t.text :address
      t.string :postcode, limit: 12
      t.string :state

      t.timestamps
    end
    
    create_table :contact_media do |t|
      t.integer :person_id
      t.integer :company_id
      t.integer :medium_type
      t.string :medium, limit: 50

      t.timestamps
    end
    
    create_table :contact_medium_types do |t|
      t.string :description, limit: 24

      t.timestamps
    end
  end
end
