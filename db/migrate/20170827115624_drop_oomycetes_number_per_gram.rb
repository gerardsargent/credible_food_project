class DropOomycetesNumberPerGram < ActiveRecord::Migration[5.0]
  def change
    remove_column :samples, :oomycetes_number_per_gram
  end
end
