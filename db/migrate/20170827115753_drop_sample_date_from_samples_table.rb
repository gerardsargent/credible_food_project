class DropSampleDateFromSamplesTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :samples, :sample_date
  end
end
