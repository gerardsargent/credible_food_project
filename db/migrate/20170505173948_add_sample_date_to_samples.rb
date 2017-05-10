class AddSampleDateToSamples < ActiveRecord::Migration[5.0]
  def change
    add_column :samples, :sample_date, :date
  end
end
