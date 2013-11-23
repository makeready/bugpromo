class AddNameToTeamname < ActiveRecord::Migration
  def change
  	add_column :teamnames, :name, :string
  end
end
