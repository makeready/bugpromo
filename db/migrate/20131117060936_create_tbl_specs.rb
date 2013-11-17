class CreateTblSpecs < ActiveRecord::Migration
  def change
    create_table :tbl_specs do |t|

    	t.text :content
    	t.integer :promo_id

      t.timestamps
    end
  end
end
