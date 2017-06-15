class DropNoBacteriaPerGram < ActiveRecord::Migration[5.0]
  def change
    remove_column :samples, :no_bacteria_per_gram
  end
end
