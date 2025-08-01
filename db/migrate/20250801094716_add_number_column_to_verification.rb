class AddNumberColumnToVerification < ActiveRecord::Migration[8.0]
  def change
    add_column :verifications, :profit, :integer
  end
end
