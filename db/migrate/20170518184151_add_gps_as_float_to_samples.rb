class AddGpsAsFloatToSamples < ActiveRecord::Migration[5.0]
  def change
    add_column :samples, :gps, :float
  end
end
