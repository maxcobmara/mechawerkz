json.array!(@contact_media) do |contact_medium|
  json.extract! contact_medium, :person_id, :company_id, :medium_type, :medium
  json.url contact_medium_url(contact_medium, format: :json)
end
