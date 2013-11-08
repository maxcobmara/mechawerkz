json.array!(@travel_requests) do |travel_request|
  json.extract! travel_request, :staff_id, :document_id, :depart_at, :return_at, :own_car, :project_id, :company_id, :contact_person_id, :is_submitted, :submitted_on, :is_approved, :approved_by, :approved_on
  json.url travel_request_url(travel_request, format: :json)
end
