class AddColumnAgeToCustomers < ActiveRecord::Migration[8.0]
  def change
    add_column :customers, :age, :integer
  end
end
