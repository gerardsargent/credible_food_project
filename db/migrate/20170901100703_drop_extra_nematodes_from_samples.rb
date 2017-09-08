class DropExtraNematodesFromSamples < ActiveRecord::Migration[5.0]
  def change
    def down
      remove_column :samples, :bacterial_nematodes
      remove_column :samples, :fungal_nematodes
      remove_column :samples, :predator_nematodes
      remove_column :samples, :root_nematodes
    end
  end
end
