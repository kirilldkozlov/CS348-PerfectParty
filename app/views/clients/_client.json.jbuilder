json.extract! client, :id, :id, :first_name, :last_name, :telephone, :email, :created_at, :updated_at
json.url client_url(client, format: :json)
