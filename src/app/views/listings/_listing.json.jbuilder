json.extract! listing, :id, :title, :artist, :price, :description, :user_id, :created_at, :updated_at
json.url listing_url(listing, format: :json)
