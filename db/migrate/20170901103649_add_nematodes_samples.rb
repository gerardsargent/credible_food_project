class AddNematodesSamples < ActiveRecord::Migration[5.0]
  def change
    add_column :samples, :nematodes_bacteria, :integer
    add_column :samples, :nematodes_fungi, :integer
    add_column :samples, :nematodes_predator, :integer
    add_column :samples, :nematodes_root, :integer
  end
end
