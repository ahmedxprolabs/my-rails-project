class Photo < ApplicationRecord
  has_many :reviews, as: :reviewable
end
