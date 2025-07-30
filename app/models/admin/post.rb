module Admin
  class Post < ApplicationRecord
    has_many :comments, class_name: "Admin::Comment", dependent: :destroy
  end
end
