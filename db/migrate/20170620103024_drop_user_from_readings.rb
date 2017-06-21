class DropUserFromReadings < ActiveRecord::Migration[5.0]
  def change
    remove_column :readings, :user_id
  end
end
