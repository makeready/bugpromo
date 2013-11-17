class CreateSheets < ActiveRecord::Migration
  def change
    create_table :sheets do |t|
    	t.boolean :sens
    	t.boolean :flames
    	t.boolean :oilers
    	t.boolean :van_hky
    	t.boolean :world
    	t.boolean :one
    	t.boolean :east
    	t.boolean :ontario
    	t.boolean :west
    	t.boolean :pacific
    	t.boolean :is_360
    	t.boolean :snipe_required
    	t.string :weekday1
    	t.string :weekday2
    	t.string :weekday3
    	t.integer :user_id
      t.timestamps
    end
  end
end
