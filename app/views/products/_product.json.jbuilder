json.extract! product, :id, :name, :description, :text, :user_id, :created_at, :updated_at
json.url product_url(product, format: :json)
