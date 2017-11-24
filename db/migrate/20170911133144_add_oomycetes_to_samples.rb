class AddOomycetesToSamples < ActiveRecord::Migration[5.0]
  def change
    add_column :samples, :oomycetes_diameter, :float
  end
end
