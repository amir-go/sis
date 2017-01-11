class Admin::UsersController < AdminController
	def index
		@users = User.search(params[:search]).paginate(:page => params[:page], :per_page => 20)
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

		if @user.update_attributes(user_params)
			flash[:notice] = "User edited succesfully!"
			render :edit
		else
			render :edit
		end
	end

	def destroy
		@user = User.find(params[:id]).destroy

		if @user.destroy
			flash[:warning] = "User deleted!"
			redirect_to admin_users_path
		else
			renirect_to admin_dashboard_path
		end
	end

	private

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name,
																 :year, :department, :date_of_birth)
	end
end