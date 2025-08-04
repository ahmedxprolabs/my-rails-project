class Student < ApplicationRecord
  validates :username, presence: true, NoNumbersValidator: true
end
