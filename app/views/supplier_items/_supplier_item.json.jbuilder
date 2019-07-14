json.extract! supplier_item, :id, :id, :supplier_id, :item_id, :quantity, :cost, :created_at, :updated_at
json.url supplier_item_url(supplier_item, format: :json)
