class AddReadingLabelToSamples < ActiveRecord::Migration[5.0]
  def change
    add_column :samples, :entry_1_label, :integer
    add_column :samples, :entry_2_label, :integer
    add_column :samples, :entry_3_label, :integer
    add_column :samples, :entry_4_label, :integer
  end
end
