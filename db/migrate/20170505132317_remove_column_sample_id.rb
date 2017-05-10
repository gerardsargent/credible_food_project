class RemoveColumnSampleId < ActiveRecord::Migration[5.0]
  def change
    remove_column :samples, :sample_id
  end
end
