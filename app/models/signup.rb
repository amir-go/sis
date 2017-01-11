class Signup < ActiveRecord::Base
	belongs_to :user
	belongs_to :exam

	before_save :check_validation?

	def check_validation?
		if (self.exam.start_date - Time.now).to_i / 1.day < 0
			return false
		elsif Evaluation.where(user_id: self.user_id, subject_id: self.exam.subject_id).present?
			return false
		else
			return true
		end
	end
end