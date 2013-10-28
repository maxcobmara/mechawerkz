json.array!(@document_binders) do |document_binder|
  json.extract! document_binder, :code, :description, :volume, :contact_company_id, :owned_by, :location_id
  json.url document_binder_url(document_binder, format: :json)
end
