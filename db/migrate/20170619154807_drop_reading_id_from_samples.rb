class DropReadingIdFromSamples < ActiveRecord::Migration[5.0]
  def change
    remove_column :samples, :reading_id
  end
end
