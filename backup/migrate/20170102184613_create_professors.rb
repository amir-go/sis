class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
    	t.string :first_name, null: false
    	t.string :last_name, null: false
    	t.string :title

    	t.timestamps null: false
    end
  end
end
