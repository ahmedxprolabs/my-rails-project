class CreateReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.references :reviewable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
