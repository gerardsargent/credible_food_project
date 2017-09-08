class DropNematodesFromSamplesAgain < ActiveRecord::Migration[5.0]
  def change
    remove_column :samples, :nematodes
  end
end
