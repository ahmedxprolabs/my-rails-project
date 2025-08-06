class Report < ApplicationRecord
  has_many :reviews, as: :reviewable
end
