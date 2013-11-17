class CreateAirtimes < ActiveRecord::Migration
  def change
    create_table :airtimes do |t|
    	t.integer :sheet_id
    	t.time :time
    	t.string :timezone
      t.timestamps
    end
  end
end
