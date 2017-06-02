class AddBigIntColumnsToDb < ActiveRecord::Migration[5.0]
  def change
    add_column :samples, :micrograms, :bigint
    add_column :samples, :actinobacteria_length_cm, :bigint
    add_column :samples, :actinobacteria_micrograms, :bigint
    add_column :samples, :fungal_strands_cm, :bigint
    add_column :samples, :fungi_micrograms, :bigint
    add_column :samples, :oomycetes_number_per_gram, :bigint
    add_column :samples, :oomycetes_micrograms, :bigint
    add_column :samples, :flagellate_protozoa, :bigint
    add_column :samples, :amoebae_protozoa, :bigint
    add_column :samples, :ciliates_protozoa, :bigint
    add_column :samples, :nematodes_protozoa, :bigint
  end
end
