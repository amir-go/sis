class AddYearToExams < ActiveRecord::Migration
  def change
  	add_column :exams, :year, :integer, default: 1, null: false
  end
end
