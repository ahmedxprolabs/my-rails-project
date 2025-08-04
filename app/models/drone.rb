class Drone < ApplicationRecord    
  # == Basic Validations ==
  validates :drone_name, :drone_type, presence: true
  validates :drone_id, absence: true

  # == Type Restrictions ==
  validates :drone_type, exclusion: {
    in: %w(fictional alien),
    message: "is not a recognized drone type"
  }

  validates :drone_id, format: {
    with: /\A[DRN]{3}-\d{4}\z/,
    message: "must be in format DRN-1234"
  }

  validates :operating_area, inclusion: {
    in: %w(city rural industrial offshore mountain),
    message: "%{value} is not an approved area"
  }

  # == Length Validation ==
  validates :maintenance_notes, length: {
    minimum: 10,
    maximum: 500
  }, allow_blank: true

  # == Numericality ==
  validates :flight_hours, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }

  validates :payload_capacity, numericality: {
    greater_than: 0
  }

  # == Uniqueness Validation ==
  validates :drone_name, uniqueness: {
    scope: :drone_type,
    message: "already exists for this drone type"
  }

  # == Conditional Validation ==
  validates :maintenance_notes, presence: true, if: :restricted_zone?

  def restricted_zone?
    restriction_zone == true
  end

  # == Custom Validation ==
  validate :reasonable_flight_hours

  def reasonable_flight_hours
    if drone_type == "survey" && flight_hours.present? && flight_hours > 20000
      errors.add(:flight_hours, "seems high for drone")
    end
  end
end
