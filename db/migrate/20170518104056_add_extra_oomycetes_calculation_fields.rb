class AddExtraOomycetesCalculationFields < ActiveRecord::Migration[5.0]
  def change
    add_column :samples, :oomycetes_strands_cm, :integer
    add_column :samples, :oomycetes_average_diameter_in_um, :float
    add_column :samples, :oomycetes_average_diameter_in_cm, :float
  end
end
