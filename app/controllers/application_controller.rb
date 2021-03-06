class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	before_filter :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?
	
	layout :layout_by_resource

	protected

	def layout_by_resource
		if devise_controller?
			"devise"
		else
			"application"
		end
	end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :year, :department])
	end

	def redirect_student
		redirect_to root_path if current_user.role == 0
	end
end
