json.extract! profile, :id, :bio, :created_at, :updated_at
json.url profile_url(profile, format: :json)
