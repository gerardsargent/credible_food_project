class AddSampleGroupToSampleTable < ActiveRecord::Migration[5.0]
  def change
    add_column :samples, :sample_gp, :integer
    add_index :samples, :sample_gp
  end
end
