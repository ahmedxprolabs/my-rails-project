class CreateReels < ActiveRecord::Migration[8.0]
  def change
    create_table :reels do |t|
      t.string :title
      t.integer :views
      t.references :influencer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
