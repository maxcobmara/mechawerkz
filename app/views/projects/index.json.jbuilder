json.array!(@projects) do |project|
  json.extract! project, :code, :name, :customer_ref, :company_id, :start_at, :end_at, :value
  json.url project_url(project, format: :json)
end
