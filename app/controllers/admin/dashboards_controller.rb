class Admin::DashboardsController < AdminController
	def show
		@users = User.all
		@professors = Professor.all
		@subjects = Subject.all
	end
end