class Signup < ActiveRecord::Base
	belongs_to :user
	belongs_to :exam

	before_save :check_date?

	def check_date?
		if (self.exam.start_date - Time.now).to_i / 1.day > -1
			return true
		else
			return false
		end
	end
end