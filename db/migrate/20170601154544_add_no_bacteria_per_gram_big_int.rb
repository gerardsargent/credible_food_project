class AddNoBacteriaPerGramBigInt < ActiveRecord::Migration[5.0]
  def change
    add_column :samples, :no_bacteria_per_gram, :bigint
  end
end
