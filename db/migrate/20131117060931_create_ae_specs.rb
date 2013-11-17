class CreateAeSpecs < ActiveRecord::Migration
  def change
    create_table :ae_specs do |t|

      t.timestamps
    end
  end
end
