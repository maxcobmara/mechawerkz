json.array!(@contact_medium_types) do |contact_medium_type|
  json.extract! contact_medium_type, :description
  json.url contact_medium_type_url(contact_medium_type, format: :json)
end
