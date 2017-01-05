class AdminController < ApplicationController
	before_action :authorize_for_admins
	layout "admin"

	def authorize_for_admins
		redirect_to root_path unless current_user.admin?
	end
end