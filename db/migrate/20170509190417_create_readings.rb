class CreateReadings < ActiveRecord::Migration[5.0]
  def change
    create_table :readings do |t|

      t.timestamps
    end
  end
end
