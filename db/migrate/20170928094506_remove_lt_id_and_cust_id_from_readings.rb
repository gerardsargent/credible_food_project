class RemoveLtIdAndCustIdFromReadings < ActiveRecord::Migration[5.0]
  def change
    remove_column :readings, :lt_id
    remove_column :readings, :cust_id
  end
end
