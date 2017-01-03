class Exam < ActiveRecord::Base
	belongs_to :professor
	belongs_to :subject

	has_many :signups
	has_many :users, through: :exams
end