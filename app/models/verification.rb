class Verification < ApplicationRecord
  validates :username, confirmation: { case_sensitive: false }
  validates_each :username  do |record, attr, value|
    if value =~ /\A[[:lower:]]/
      record.errors.add(attr, "must start with upper case")
    end
  end

  validates :profit, comparison: { greater_than: 3 }, allow_nil: true
end
