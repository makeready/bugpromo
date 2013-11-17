class CreateTblSpecs < ActiveRecord::Migration
  def change
    create_table :tbl_specs do |t|

      t.timestamps
    end
  end
end
