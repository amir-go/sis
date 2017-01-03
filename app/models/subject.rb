class Subject < ActiveRecord::Base
	has_many :exams
	has_many :professors, through: :exams
end