class DropFungiCalculation < ActiveRecord::Migration[5.0]
  def change
    remove_column :samples, :fungi_calculation
  end
end
