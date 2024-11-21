class AddToFeedJob
  include Sidekiq::Job

  def perform(feed_item_id)
    feed_item = FeedItem.find(feed_item_id)
    user = feed_item.user

    users.each do |user|
      user.feed << feed_item
    end

  end
end
