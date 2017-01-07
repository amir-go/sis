class SubjectsController < ApplicationController
	def index
		@first_year = Subject.where(year: 1)
		@second_year = Subject.where(year: 2)
		@third_year = Subject.where(year: 3)
	end
end