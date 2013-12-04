json.array!(@documents) do |document|
  json.extract! document, :ref_no, :title, :project_id, :document_category_id, :type, :document_date, :recieved_from, :received_on, :filed_by, :addressed_to, :description, :binder_id, :document_file_name, :document_content_type, :document_file_size, :document_updated_at
  json.url document_url(document, format: :json)
end
