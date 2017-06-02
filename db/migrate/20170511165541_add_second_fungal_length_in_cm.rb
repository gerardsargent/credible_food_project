class AddSecondFungalLengthInCm < ActiveRecord::Migration[5.0]
  def change
    add_column :samples, :fungal_cm_length_for_calc, :float
  end
end
