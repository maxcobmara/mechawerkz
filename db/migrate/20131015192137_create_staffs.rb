class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :id_no
      t.string :name
      t.string :kwsp_code
      t.string :tax_code
      t.integer :access_id
      t.integer :title_id
      t.integer :file_id
      t.integer :user_id
      t.date :date_of_birth
      t.integer :state
      t.string :country_code
      t.string :citizenship
      t.string :birth_cert
      t.string :gravatar_email
      t.string :blood_type
      t.string :marital_status_type
      t.integer :race
      t.integer :religion
      t.string :gender

      t.timestamps
    end
  end
end
