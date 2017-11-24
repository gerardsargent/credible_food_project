class AddFungiAvDiameterInUm < ActiveRecord::Migration[5.0]
  def change
    add_column :samples, :fungi_average_diameter_in_um, :float
  end
end
