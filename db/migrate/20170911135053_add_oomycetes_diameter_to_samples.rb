class AddOomycetesDiameterToSamples < ActiveRecord::Migration[5.0]
  def change
    add_column :samples, :oomycetes_diameter, :integer
  end
end
