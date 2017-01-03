class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
    	t.string  :name, null: false
    	t.integer :ects, null: false
    	t.integer :year, null: false

    	t.timestamps null: false
    end
  end
end
