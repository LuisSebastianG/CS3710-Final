class FeedItem < ApplicationRecord
  belongs_to :user
  has_many :scrolls
end
