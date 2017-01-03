class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.references :user, index: true, foreign_key: true

    	t.string :first_name, null: false
    	t.string :last_name, null: false
    	t.integer :year, null: false
    	t.string :department, null: false
    	t.datetime :date_of_birth

    	t.timestamps null: false
    end
  end
end
