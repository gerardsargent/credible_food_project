class CreateReadings < ActiveRecord::Migration[5.0]
  def change
    create_table :readings do |t|
      t.string :land_name
      t.string :crop_growing
      t.string :gps

      t.timestamps
    end
  end
end
