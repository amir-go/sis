class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :first_name, null: false
    	t.string :last_name, null: false
    	t.integer :year, null: false
    	t.string :department, null: false
    	t.datetime :date_of_birth

    	t.timestamps null: false
    end
  end
end
