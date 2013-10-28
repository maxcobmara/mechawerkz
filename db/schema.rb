# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131028014748) do

  create_table "contact_companies", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "postcode",   limit: 12
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_media", force: true do |t|
    t.integer  "person_id"
    t.integer  "company_id"
    t.integer  "medium_type"
    t.string   "medium",      limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_medium_types", force: true do |t|
    t.string   "description", limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_people", force: true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.string   "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "document_binders", force: true do |t|
    t.string   "code"
    t.string   "description"
    t.string   "volume"
    t.integer  "contact_company_id"
    t.integer  "owned_by"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name",        null: false
    t.string   "title",       null: false
    t.text     "description", null: false
    t.text     "the_role",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "staff_positions", force: true do |t|
    t.string   "code"
    t.string   "combo_code"
    t.string   "name"
    t.string   "unit"
    t.text     "tasks_main"
    t.text     "tasks_other"
    t.string   "ancestry"
    t.integer  "ancestry_depth"
    t.boolean  "is_acting"
    t.integer  "staff_grade_min"
    t.integer  "staff_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "staff_positions", ["code", "ancestry"], name: "index_staff_positions_on_code_and_ancestry"

  create_table "staffs", force: true do |t|
    t.string   "id_no"
    t.string   "name"
    t.string   "kwsp_code"
    t.string   "tax_code"
    t.integer  "access_id"
    t.integer  "title_id"
    t.integer  "file_id"
    t.integer  "user_id"
    t.date     "date_of_birth"
    t.integer  "state"
    t.string   "country_code"
    t.string   "citizenship"
    t.string   "birth_cert"
    t.string   "gravatar_email"
    t.string   "blood_type"
    t.string   "marital_status_type"
    t.integer  "race"
    t.integer  "religion"
    t.string   "gender"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
