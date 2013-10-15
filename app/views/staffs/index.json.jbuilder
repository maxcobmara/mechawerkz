json.array!(@staffs) do |staff|
  json.extract! staff, :id_no, :name, :kwsp_code, :tax_code, :access_id, :title_id, :file_id, :user_id, :date_of_birth, :state, :country_code, :citizenship, :birth_cert, :gravatar_email, :blood_type, :marital_status_type, :race, :religion, :gender
  json.url staff_url(staff, format: :json)
end
