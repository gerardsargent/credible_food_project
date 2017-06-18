class CreateReadings < ActiveRecord::Migration[5.0]
  def change
    create_table :readings do |t|
      t.string :client
      t.string :organisation
      t.datetime :date_collected
      t.datetime :date_observed
      t.string :location
      t.string :plants_present
      t.string :plants_desired
      t.text :other_notes
      t.string :observed_by
      t.integer :lt_id
      t.integer :cust_id

      t.timestamps
    end
  end
end
