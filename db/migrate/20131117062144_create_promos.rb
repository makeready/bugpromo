class CreatePromos < ActiveRecord::Migration
  def change
    create_table :promos do |t|
    	t.integer :length
    	t.string :quantel_name
    	t.string :s4m_name
    	t.integer :mcr_number
    	t.date :purge_date
    	t.integer :sheet_id
      t.timestamps
      t.integer :property_id
      t.date :event_date
      t.date :due_date
      t.text :note
      t.string :team1
      t.string :team2
    end
  end
end
