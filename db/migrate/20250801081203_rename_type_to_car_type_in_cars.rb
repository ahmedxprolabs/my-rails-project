class RenameTypeToCarTypeInCars < ActiveRecord::Migration[8.0]
  def change
    rename_column :cars, :type, :car_type
  end
end
