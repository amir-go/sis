class Admin::SignupsController < AdminController
	def show
		@signup = Signup.find(params[:id])
	end

	def new
		@signup = Signup.new
	end

	def create
		@signup = Signup.new(signup_params)

		if @signup.save
			flash[:notice] = "Signup created succesfully!"
			redirect_to admin_signup_path(@signup.id)
		else
			render :new
		end
	end

	def edit
		@signup = Signup.find(params[:id])
	end

	def update
		@signup = Signup.find(params[:id])

		if @signup.update_attributes(signup_params)
			flash[:notice] = "Signup edited succesfully!"
			redirect_to admin_signup_path(@signup.id)
		else
			render :edit
		end
	end

	def destroy
		@signup = Signup.find(params[:id])
		
		if @signup.destroy
			flash[:notice] = "Signup deleted succesfully!"
			redirect_to admin_signup_path(@signup.id)
		else
			redirect_to admin_signup_path(@signup.id)
		end
	end

	private

	def signup_params
		params.require(:signup).permit(:user_id, :exam_id)
	end
end