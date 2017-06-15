class CreateSamples < ActiveRecord::Migration[5.0]
  def change
    create_table :samples do |t|
      t.integer :user_id
      t.integer :sample_id
      t.integer :reading_number
      t.integer :bacterial_number
      t.string :bacterial_size_shape
      t.float :bacterial_mean
      t.float :bacterial_standard_deviation
      t.integer :bacterial_dilution
      t.integer :no_bacteria_per_gram
      t.integer :micrograms
      t.integer :actinobacteria
      t.float :actinobacteria_mean
      t.float :actinobacterial_standard_deviation
      t.integer :actinobacteria_dilution
      t.float :actinobacteria_length_cm
      t.integer :actinobacteria_micrograms
      t.integer :fungi
      t.integer :fungi_diameter
      t.string :fungi_colour
      t.integer :fungi_calculation
      t.float :fungi_mean
      t.float :fungi_standard_deviation
      t.integer :fungi_dilution
      t.integer :fungal_strands_cm
      t.integer :fungi_micrograms
      t.integer :oomycetes
      t.integer :oomycetes_diameter
      t.string :oomycetes_colour
      t.integer :oomycetes_calculation
      t.float :oomycetes_mean
      t.float :oomycetes_standard_deviation
      t.integer :oomycetes_dilution
      t.integer :oomycetes_number_per_gram
      t.float :oomycetes_micrograms
      t.integer :flagellate
      t.float :flagellate_mean
      t.float :flagellate_standard_deviation
      t.integer :flagellate_dilution
      t.integer :flagellate_protozoa
      t.integer :amoebae
      t.float :amoebae_mean
      t.float :amoebae_standard_deviation
      t.integer :amoebae_dilution
      t.integer :amoebae_protozoa
      t.integer :ciliates
      t.float :ciliates_mean
      t.float :ciliates_standard_deviation
      t.integer :ciliates_dilution
      t.integer :ciliates_protozoa
      t.integer :nematodes
      t.float :nematodes_mean
      t.integer :nematodes_dilution
      t.float :nematodes_protozoa
      t.float :fb_biomass_ratio
      t.float :gps
      t.date :sample_date

      t.timestamps
    end
  end
end
