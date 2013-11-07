json.array!(@bills) do |bill|
  json.extract! bill, :project_id, :pay_to, :document_id, :category_id, :company_id, :amount
  json.url bill_url(bill, format: :json)
end
