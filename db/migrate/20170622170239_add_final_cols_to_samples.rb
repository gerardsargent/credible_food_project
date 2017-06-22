class AddFinalColsToSamples < ActiveRecord::Migration[5.0]
  def change
    add_column :samples, :actinobacteria, :float
    add_column :samples, :fungi, :float
    add_column :samples, :oomycetes, :float
    add_column :samples, :bacterial_nematodes, :integer
    add_column :samples, :fungal_nematodes, :integer
    add_column :samples, :predator_nematodes, :integer
    add_column :samples, :root_nematodes, :integer
  end
end
