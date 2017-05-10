class AddIndexToSampleIdAndUserId < ActiveRecord::Migration[5.0]
  def change
    add_index :samples, :sample_id
    add_index :samples, :user_id
  end
end
