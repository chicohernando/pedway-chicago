class AddFieldsToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :number_of_reviews, :integer
    add_column :locations, :phone_number, :string
    add_column :locations, :is_closed, :boolean
    add_column :locations, :address, :string
    add_column :locations, :city, :string
    add_column :locations, :state, :string
    add_column :locations, :zip_code, :string
    add_column :locations, :latitude, :float
    add_column :locations, :longitude, :float
  end
end
