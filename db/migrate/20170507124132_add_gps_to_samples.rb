class AddGpsToSamples < ActiveRecord::Migration[5.0]
  def change
    add_column :samples, :gps, :integer
  end
end
