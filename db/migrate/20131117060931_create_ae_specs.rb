class CreateAeSpecs < ActiveRecord::Migration
  def change
    create_table :ae_specs do |t|
    	t.text :content
    	t.integer :promo_id
      t.timestamps
    end
  end
end
