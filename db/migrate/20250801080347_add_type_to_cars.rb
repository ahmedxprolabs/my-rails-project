class AddTypeToCars < ActiveRecord::Migration[8.0]
  def change
    add_column :cars, :type, :string
  end
end
