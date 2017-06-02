class AddCoverSlipToSample < ActiveRecord::Migration[5.0]
  def change
    add_column :samples, :coverslip, :integer
  end
end
