class Exam < ActiveRecord::Base
	belongs_to :professor
	belongs_to :subject

	has_many :signups
	has_many :users, through: :exams

	def view
		"#{subject.name} | #{start_date.strftime("%-d.%-m.%Y. %H:%M")}"
	end
end