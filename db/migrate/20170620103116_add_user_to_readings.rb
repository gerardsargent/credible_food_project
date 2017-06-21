class AddUserToReadings < ActiveRecord::Migration[5.0]
  def change
    add_reference :readings, :user, foreign_key: true
  end
end
