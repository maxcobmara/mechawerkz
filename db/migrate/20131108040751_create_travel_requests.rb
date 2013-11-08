class CreateTravelRequests < ActiveRecord::Migration
  def change
    create_table :travel_requests do |t|
      t.integer :staff_id
      t.integer :document_id
      t.datetime :depart_at
      t.datetime :return_at
      t.boolean :own_car
      t.integer :project_id
      t.integer :company_id
      t.integer :contact_person_id
      t.boolean :is_submitted
      t.date :submitted_on
      t.boolean :is_approved
      t.integer :approved_by
      t.date :approved_on

      t.timestamps
    end
  end
end
