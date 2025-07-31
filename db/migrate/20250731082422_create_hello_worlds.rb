class CreateHelloWorlds < ActiveRecord::Migration[8.0]
  def change
    create_table :hello_worlds do |t|
      t.string :message

      t.timestamps
    end
  end
end
