class Professor < ActiveRecord::Base
	has_many :exams
	has_many :subjects, through: :exams
end