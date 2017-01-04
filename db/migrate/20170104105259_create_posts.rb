class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :title
    	t.text :description, default: 'Enter description'

    	t.timestamps null: false
    end
  end
end
