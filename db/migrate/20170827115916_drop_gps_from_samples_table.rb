class DropGpsFromSamplesTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :samples, :gps
  end
end
