class DropOomycetesMicrogramsFromSamples < ActiveRecord::Migration[5.0]
  def change
    remove_column :samples, :oomycetes_micrograms
  end
end
