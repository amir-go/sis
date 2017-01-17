class Admin::UsersController < AdminController
	def index
		@users = User.search(params[:search]).paginate(:page => params[:page], :per_page => 15)

		unless params[:filter].blank?
			@users = User.where(year: 1).paginate(:page => params[:page], :per_page => 20) if params[:filter] == 'year_1'
			@users = User.where(year: 2).paginate(:page => params[:page], :per_page => 20) if params[:filter] == 'year_2'
			@users = User.where(year: 3).paginate(:page => params[:page], :per_page => 20) if params[:filter] == 'year_3'
		end
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
			flash[:u_notice] = "User edited succesfully!"
			render :edit
		else
			render :edit
		end
	end

	def destroy
		@user = User.find(params[:id]).destroy

		if @user.destroy
			flash[:u_warning] = "User deleted!"
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