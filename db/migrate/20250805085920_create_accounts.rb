class CreateAccounts < ActiveRecord::Migration[8.0]
  def change
    create_table :accounts do |t|
      t.references :supplier, null: false, index: { unique: true}, foreign_key: true
      t.string :account_number

      t.timestamps
    end
  end
end
