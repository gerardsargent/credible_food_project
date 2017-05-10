class AddSampleNoAndUserIdToSamples < ActiveRecord::Migration[5.0]
  def change
    add_column :samples, :user_id, :integer
    add_column :samples, :sample_id, :integer
  end
end
