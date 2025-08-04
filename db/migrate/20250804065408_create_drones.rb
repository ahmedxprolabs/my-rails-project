class CreateDrones < ActiveRecord::Migration[8.0]
  def change
    create_table :drones do |t|
      t.string :drone_name
      t.string :drone_type
      t.integer :flight_hours
      t.float :payload_capacity
      t.boolean :restriction_zone
      t.string :operating_area
      t.string :drone_id
      t.text :maintenance_notes

      t.timestamps
    end
  end
end
