class AddGpsIndexToSamples < ActiveRecord::Migration[5.0]
  def change
    add_index :samples, :gps
  end
end
