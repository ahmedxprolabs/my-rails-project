class Reel < ApplicationRecord
  belongs_to :influencer
  has_many :likes
end
