class AddPropertyNameToSheets < ActiveRecord::Migration
  def change
  	add_column :sheets, :property_name, :string
  end
end
