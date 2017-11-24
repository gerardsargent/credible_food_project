class AddSampleTypeToReadings < ActiveRecord::Migration[5.0]
  def change
    add_column :readings, :sample_type, :string
  end
end
