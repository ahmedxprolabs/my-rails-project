class CreateClients < ActiveRecord::Migration[8.0]
  def change
    create_table :clients do |t|
      t.integer :store_id
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end
