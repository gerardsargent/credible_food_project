class UpdateSamplesTableWithBigInt < ActiveRecord::Migration[5.0]
  def change
    remove_column :samples, :micrograms
    remove_column :samples, :actinobacteria_length_cm
    remove_column :samples, :actinobacteria_micrograms
    remove_column :samples, :fungal_strands_cm
    remove_column :samples, :fungi_micrograms
    remove_column :samples, :oomycetes_number_per_gram
    remove_column :samples, :oomycetes_micrograms
    remove_column :samples, :flagellate_protozoa
    remove_column :samples, :amoebae_protozoa
    remove_column :samples, :ciliates_protozoa
    remove_column :samples, :nematodes_protozoa
  end
end
