class AddFungiCalculationAsFloat < ActiveRecord::Migration[5.0]
  def change
    add_column :samples, :fungi_calculation, :float
  end
end
