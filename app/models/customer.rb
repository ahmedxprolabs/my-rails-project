class Customer < ApplicationRecord
  validates :username, :email, presence: true
  validates :age, presence: true

  before_validation :ensure_username_has_value
  after_validation :log_errors
  after_create :notify_created
  after_destroy :notify_destroyed
  after_save :notify_saved, 
             if: -> { email.ends_with?("@gmail.com") }, 
             unless: -> { username == "admin" }
  after_commit :notify_commit

  after_initialize do |user|
    Rails.logger.info("You have initialized an object!")
  end

  before_validation do
    Rails.logger.info("Checking age before validation: #{age.inspect}")
    throw :abort if age.to_i < 1
  end

  private

  def ensure_username_has_value
    self.username = email if username.blank?
  end

  def log_errors
    if errors.any?
      Rails.logger.error("Validation failed: #{errors.full_messages.join(', ')}")
    end
  end

  def notify_created
    puts "It is created."
  end

  def notify_destroyed
    puts "It is destroyed."
  end

  def notify_saved
    puts "It is saved."
  end

  def notify_commit
    puts "It is committed."
  end
end
