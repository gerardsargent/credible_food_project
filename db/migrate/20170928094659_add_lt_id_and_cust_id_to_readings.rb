class AddLtIdAndCustIdToReadings < ActiveRecord::Migration[5.0]
  def change
    add_column :readings, :lt_id, :string
    add_column :readings, :cust_id, :string
  end
end
