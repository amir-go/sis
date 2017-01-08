class RemoveYearFromExams < ActiveRecord::Migration
  def change
  	remove_column :exams, :year
  end
end
