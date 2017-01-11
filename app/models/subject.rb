class Subject < ActiveRecord::Base
	has_many :exams
	has_many :professors, through: :exams

	has_many :evaluations
	has_many :users, through: :evaluations
end