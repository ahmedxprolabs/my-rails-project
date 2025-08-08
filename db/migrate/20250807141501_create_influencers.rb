class CreateInfluencers < ActiveRecord::Migration[8.0]
  def change
    create_table :influencers do |t|
      t.string :name
      t.string :handle

      t.timestamps
    end
  end
end
