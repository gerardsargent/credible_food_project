class DropOomycetesStrandsCm < ActiveRecord::Migration[5.0]
  def change
    remove_column :samples, :oomycetes_strands_cm
  end
end