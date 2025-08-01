class NoNumbersValidator < ActiveModel::EachValidator
  RESERVED_USERNAMES = ["admin", "root", "superuser"]

  def validate(record)
    if RESERVED_USERNAMES.include?(record.username)
      record.errors.add(:username, "is reserved and cannot be used")
    end
  end
end