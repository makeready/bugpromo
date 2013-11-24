class AddLogoPathToProperties < ActiveRecord::Migration
  def change
  	add_column :properties, :logo_path, :string
  end
end
