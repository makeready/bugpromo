class CreateTeamnames < ActiveRecord::Migration
  def change
    create_table :teamnames do |t|

      t.timestamps
    end
  end
end
