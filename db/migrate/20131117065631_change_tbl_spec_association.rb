class ChangeTblSpecAssociation < ActiveRecord::Migration
  def change
  	add_column :tbl_specs, :sheet_id, :integer
  	remove_column :tbl_specs, :promo_id, :integer
  end
end
