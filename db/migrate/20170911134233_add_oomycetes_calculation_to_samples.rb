class AddOomycetesCalculationToSamples < ActiveRecord::Migration[5.0]
  def change
    add_column :samples, :oomycetes_calculation, :float
  end
end
