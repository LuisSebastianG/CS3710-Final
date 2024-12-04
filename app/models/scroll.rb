class Scroll < ApplicationRecord
  belongs_to :user
  belongs_to :feed_item
end
