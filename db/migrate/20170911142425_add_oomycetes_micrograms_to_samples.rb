class AddOomycetesMicrogramsToSamples < ActiveRecord::Migration[5.0]
  def change
    add_column :samples, :oomycetes_micrograms, :float
  end
end
