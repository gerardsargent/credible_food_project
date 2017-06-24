class DropReadingIdFromSamples < ActiveRecord::Migration[5.0]
  def down
    remove_column :samples, :actinobacteria
    remove_column :samples, :fungi
    remove_column :samples, :oomycetes
   # remove_column :samples, :reading_id, :integer
  end

  def up
   # add_column :samples, :actinobacteria, :float
   # add_column :samples, :fungi, :float
   # add_column :samples, :oomycetes, :float
  end
end
