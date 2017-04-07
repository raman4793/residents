json.extract! photo, :id, :image, :uploadable_id, :uploadable_type, :created_at, :updated_at
json.url photo_url(photo, format: :json)