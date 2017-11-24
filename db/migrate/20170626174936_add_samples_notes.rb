class AddSamplesNotes < ActiveRecord::Migration[5.0]
  def change
    add_column :samples, :notes, :text
  end
end
