class ChangeSampleNoToIndex < ActiveRecord::Migration[5.0]
  def change
    add_index :samples, :sample_id
  end
end
