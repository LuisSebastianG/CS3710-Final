json.extract! feed_item, :id, :body, :likes, :user_id, :created_at, :updated_at
json.url feed_item_url(feed_item, format: :json)
