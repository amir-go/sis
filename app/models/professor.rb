class Professor < ActiveRecord::Base
	has_many :exams
	has_many :subjects, through: :exams

	def full_name
		"#{title} #{first_name} #{last_name}"
	end
end