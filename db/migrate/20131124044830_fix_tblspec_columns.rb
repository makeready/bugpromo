class FixTblspecColumns < ActiveRecord::Migration
  def change
  	add_column :tbl_specs, :image_path, :string
  	add_column :tbl_specs, :property_name, :string
  	add_column :tbl_specs, :team1, :string
  	add_column :tbl_specs, :team2, :string
  	add_column :tbl_specs, :time_variable, :string
  	add_column :tbl_specs, :day, :string
  	add_column :tbl_specs, :world, :boolean
  	add_column :tbl_specs, :east, :boolean
  	add_column :tbl_specs, :ontario, :boolean
  	add_column :tbl_specs, :west, :boolean
  	add_column :tbl_specs, :pacific, :boolean
  	add_column :tbl_specs, :one, :boolean
  	add_column :tbl_specs, :logo_path, :string
  	remove_column :tbl_specs, :content

  	remove_column :ae_specs, :image_path, :string
  	remove_column :ae_specs, :property_name, :string
  	remove_column :ae_specs, :team1, :string
  	remove_column :ae_specs, :team2, :string
  	remove_column :ae_specs, :time_variable, :string
  	remove_column :ae_specs, :day, :string
  	remove_column :ae_specs, :world, :boolean
  	remove_column :ae_specs, :east, :boolean
  	remove_column :ae_specs, :ontario, :boolean
  	remove_column :ae_specs, :west, :boolean
  	remove_column :ae_specs, :pacific, :boolean
  	remove_column :ae_specs, :one, :boolean
  	remove_column :ae_specs, :logo_path, :string
  	add_column :ae_specs, :promo_id, :integer
  end
end

