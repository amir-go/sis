class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
    	t.references :subject, index: true, foreign_key: true
    	t.references :professor, index: true, foreign_key: true

    	t.datetime :start_date
    	t.string :department

    	t.timestamps null: false
    end
  end
end
