class UsersController < ApplicationController
	def show
		@user = current_user
		@evaluations = Evaluation.where(user_id: current_user.id)
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
end