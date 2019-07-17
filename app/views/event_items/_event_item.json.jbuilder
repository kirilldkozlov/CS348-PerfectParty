json.extract! event_item, :id, :item_id, :event_id, :supplier_id, :quantity, :created_at, :updated_at
json.url event_item_url(event_item, format: :json)
