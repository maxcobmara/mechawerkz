json.array!(@contact_companies) do |contact_company|
  json.extract! contact_company, :name, :address, :postcode, :state
  json.url contact_company_url(contact_company, format: :json)
end
