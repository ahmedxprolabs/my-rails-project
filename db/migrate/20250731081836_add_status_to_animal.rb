class AddStatusToAnimal < ActiveRecord::Migration[8.0]
  def up
    add_column :animals, :status, :string
  end

  def down
    remove_column :animals, :status
  end
end
