class AddReadingIdToSamples < ActiveRecord::Migration[5.0]
  def change
    add_column :samples, :reading_id, :integer
  end
end
