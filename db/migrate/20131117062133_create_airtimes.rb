class CreateAirtimes < ActiveRecord::Migration
  def change
    create_table :airtimes do |t|

      t.timestamps
    end
  end
end
