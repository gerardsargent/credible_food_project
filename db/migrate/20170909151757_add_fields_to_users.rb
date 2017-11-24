class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :address_line_1, :string
    add_column :users, :address_line_2, :string
    add_column :users, :city, :string
    add_column :users, :state_province_region, :string
    add_column :users, :zip_postcode, :string
    add_column :users, :country, :string
    add_column :users, :telephone, :string
    add_column :users, :mobile, :string
  end
end
