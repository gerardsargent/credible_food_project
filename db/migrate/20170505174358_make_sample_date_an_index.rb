class MakeSampleDateAnIndex < ActiveRecord::Migration[5.0]
  def change
    add_index :samples, :sample_date
  end
end
