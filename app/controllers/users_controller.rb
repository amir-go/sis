class UsersController < ApplicationController
	def show
		@user = current_user
		@signups = current_user.signups.where.not(evaluation: nil)
		@average = average(@signups)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update_attributes(user_params)
			redirect_to user_path(current_user)
		else
			render :edit
		end
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :year, :department, :avatar)
	end

	def average(signups)
		gpa = 0

		signups.each do |s|
			gpa += s.evaluation
		end
		
		gpa.to_d / signups.count
	end
end