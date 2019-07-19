json.extract! supplier, :id, :first_name, :last_name, :telephone, :events_supplied, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)
