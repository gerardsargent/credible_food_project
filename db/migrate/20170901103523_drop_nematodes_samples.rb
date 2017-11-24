class DropNematodesSamples < ActiveRecord::Migration[5.0]
  def change
    remove_column :samples, :nematodes_bacteria
    remove_column :samples, :nematodes_fungi
    remove_column :samples, :nematodes_predator
    remove_column :samples, :nematodes_root
  end
end
