json.extract! complaint, :id, :content, :sendable_id, :sendable_type, :recipient_id, :recipient_type, :created_at, :updated_at
json.url complaint_url(complaint, format: :json)