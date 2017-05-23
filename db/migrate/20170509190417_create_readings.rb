class CreateReadings < ActiveRecord::Migration[5.0]
  def change
    create_table :readings do |t|
      t.user_id
      t.reading_number
      t.land_name
      t.timestamps
    end
  end
end
