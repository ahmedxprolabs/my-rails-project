class CreateToys < ActiveRecord::Migration[8.0]
  def change
    create_table :toys do |t|
      t.string :name
      t.decimal :price
      t.boolean :in_stock
      t.text :description

      t.timestamps
    end
  end
end
