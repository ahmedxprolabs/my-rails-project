class AddColourColumnToCar < ActiveRecord::Migration[8.0]
  def change
    add_column :cars, :Color, :string
  end
end
