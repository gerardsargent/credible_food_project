class AddIndexToColumns < ActiveRecord::Migration[5.0]
  def change
    add_index :samples, :user_id
    add_index :samples, :sample_id
    add_index :samples, :gps
    add_index :samples, :sample_date
  end
end
