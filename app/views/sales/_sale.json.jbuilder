json.extract! sale, :id, :email, :guid, :booking_id, :stripe_id, :created_at, :updated_at
json.url sale_url(sale, format: :json)
