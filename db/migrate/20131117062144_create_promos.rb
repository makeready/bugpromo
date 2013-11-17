class CreatePromos < ActiveRecord::Migration
  def change
    create_table :promos do |t|

      t.timestamps
    end
  end
end
