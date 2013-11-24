class FixAespecColumns < ActiveRecord::Migration
  def change
  	add_column :ae_specs, :image_path, :string
  	add_column :ae_specs, :property_name, :string
  	add_column :ae_specs, :team1, :string
  	add_column :ae_specs, :team2, :string
  	add_column :ae_specs, :time_variable, :string
  	add_column :ae_specs, :day, :string
  	add_column :ae_specs, :world, :boolean
  	add_column :ae_specs, :east, :boolean
  	add_column :ae_specs, :ontario, :boolean
  	add_column :ae_specs, :west, :boolean
  	add_column :ae_specs, :pacific, :boolean
  	add_column :ae_specs, :one, :boolean
  	add_column :ae_specs, :logo_path, :string
  	remove_column :ae_specs, :content
  	remove_column :ae_specs, :promo_id
  	add_column :ae_specs, :sheet_id, :integer
  end
end
