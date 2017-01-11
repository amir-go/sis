class Admin::SignupsController < AdminController
	def index
		@signups = Signup.all
	end
	def show
		@signup = Signup.find(params[:id])
	end

	def new
		@signup = Signup.new
	end

	def create
		@signup = Signup.new(signup_params)

		if @signup.save
			flash[:notice] = "Signup created successfully!"
			redirect_to admin_signup_path(@signup.id)
		else
			render :new
		end
	end

	def edit
		@signup = Signup.find(params[:id])
		@evaluation = Evaluation.new
		@evaluation.update(user_id: @signup.user.id, subject_id: @signup.exam.subject.id)
		@signup.destroy
	end

	def update
		@signup = Signup.find(params[:id])

		if @signup.update_attributes(signup_params)
			flash[:notice] = "Signup edited successfully!"
			redirect_to admin_signup_path(@signup.id)
		else
			render :edit
		end
	end

	def destroy
		@signup = Signup.find(params[:id])
		
		if @signup.destroy
			flash[:notice] = "Signup deleted successfully!"
			redirect_to admin_signup_path(@signup.id)
		else
			redirect_to admin_signup_path(@signup.id)
		end
	end

	private

	def signup_params
		params.require(:signup).permit(:user_id, :exam_id, :evaluation)
	end
end