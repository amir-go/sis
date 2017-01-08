class AddEmailToProfessors < ActiveRecord::Migration
  def change
  	add_column :professors, :email, :string, default: '', null: false
  end
end
