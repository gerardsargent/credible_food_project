class AddReadingIdReferenceToSamples < ActiveRecord::Migration[5.0]
  def change
    add_reference :samples, :reading, foreign_key: true
  end
end
