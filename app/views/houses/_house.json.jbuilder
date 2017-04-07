json.extract! house, :id, :no, :name, :lat, :lng, :residence_association_id, :created_at, :updated_at
json.url house_url(house, format: :json)