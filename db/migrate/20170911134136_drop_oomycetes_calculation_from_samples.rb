class DropOomycetesCalculationFromSamples < ActiveRecord::Migration[5.0]
  def change
    remove_column :samples, :oomycetes_calculation
  end
end
