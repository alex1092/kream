json.extract! product, :id, :brand, :style, :size, :price, :user_id, :created_at, :updated_at
json.url product_url(product, format: :json)
