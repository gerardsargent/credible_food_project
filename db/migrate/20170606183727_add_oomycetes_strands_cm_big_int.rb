class AddOomycetesStrandsCmBigInt < ActiveRecord::Migration[5.0]
  def change
    add_column :samples, :oomycetes_strands_cm, :bigint
  end
end
