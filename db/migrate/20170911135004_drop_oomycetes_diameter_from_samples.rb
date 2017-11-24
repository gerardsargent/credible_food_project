class DropOomycetesDiameterFromSamples < ActiveRecord::Migration[5.0]
  def change
    remove_column :samples, :oomycetes_diameter
  end
end
