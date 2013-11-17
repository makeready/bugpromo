class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
    	t.name :email
    	t.string :password_digest
      t.timestamps
    end
  end
end
