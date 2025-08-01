class Car < ApplicationRecord
  validates :name, presence: true, length: { minimum: 8 }, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :color, exclusion: {
    in: %w(red blue green),
    message: "%{value} is reserved."
  }

  validates :car_type, absence: true, unless: :admin_car?

  def admin_car?
    car_type == "honda"  
  end
end

