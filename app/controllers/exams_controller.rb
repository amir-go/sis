class ExamsController < ApplicationController
	def index
		@exams = Exam.all.where(year: current_user.year)
	end
end