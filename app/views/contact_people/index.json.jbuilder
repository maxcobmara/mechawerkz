json.array!(@contact_people) do |contact_person|
  json.extract! contact_person, :name, :company_id, :position
  json.url contact_person_url(contact_person, format: :json)
end
