class FixAespec < ActiveRecord::Migration
  def change
  	add_column :ae_specs, :content, :text
  end
end
