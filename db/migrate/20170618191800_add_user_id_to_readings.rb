class AddUserIdToReadings < ActiveRecord::Migration[5.0]
  def change
    add_column :readings, :user_id, :integer
  end
end
