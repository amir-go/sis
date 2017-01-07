class ExamsController < ApplicationController
	def index
		@exams = Exam.where(year: current_user.year, department: current_user.department).order(start_date: :desc)
	end
end