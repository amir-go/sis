class ExamsController < ApplicationController
	def index
		@exams = Exam.all.where(year: current_user.year)
		@signup = Signup.where(user_id: current_user.id)
	end
end