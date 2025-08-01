module Admin
  class Comment < ApplicationRecord
    belongs_to :post, class_name: "Admin::Post"
  end
end
