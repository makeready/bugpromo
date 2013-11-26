class AddColumnsToAespec < ActiveRecord::Migration
  def change
    add_column :ae_specs, :team1, :string
    add_column :ae_specs, :team2, :string
    add_column :ae_specs, :start, :string
    add_column :ae_specs, :weekday, :string
    remove_column :ae_specs, :content
  end
end
