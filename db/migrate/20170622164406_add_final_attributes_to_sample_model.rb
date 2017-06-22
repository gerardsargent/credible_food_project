class AddFinalAttributesToSampleModel < ActiveRecord::Migration[5.0]
  def change
    remove_column :samples, :actinobacteria
    remove_column :samples, :fungi
    remove_column :samples, :oomycetes
  end
end
