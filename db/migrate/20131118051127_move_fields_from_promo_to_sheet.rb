class MoveFieldsFromPromoToSheet < ActiveRecord::Migration
  def change
  	remove_column :promos, :property_id, :integer
  	remove_column :promos, :event_date, :date
  	remove_column :promos, :due_date, :date
  	remove_column :promos, :note, :text
  	remove_column :promos, :team1, :string
  	remove_column :promos, :team2, :string
   	add_column :sheets, :property_id, :integer
  	add_column :sheets, :event_date, :date
  	add_column :sheets, :due_date, :date
  	add_column :sheets, :note, :text
  	add_column :sheets, :team1, :string
  	add_column :sheets, :team2, :string
  end
end
