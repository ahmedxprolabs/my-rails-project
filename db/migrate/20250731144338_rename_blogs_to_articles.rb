class RenameBlogsToArticles < ActiveRecord::Migration[8.0]
  def change
    rename_table :blogs, :articles
  end
end
