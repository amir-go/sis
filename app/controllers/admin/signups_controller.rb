class Admin::SignupsController < AdminController
	def index
		@signups = Signup.joins(exam: :subject).joins(exam: :professor).joins(:user).search(params[:search])

		unless params[:filter].blank?
			@signups = Signup.joins(exam: :subject).merge(Subject.where(year: 1)) if params[:filter] == 'year_1'
			@signups = Signup.joins(exam: :subject).merge(Subject.where(year: 2)) if params[:filter] == 'year_2'
			@signups = Signup.joins(exam: :subject).merge(Subject.where(year: 3)) if params[:filter] == 'year_3'
		end
	end
	
	def new
		@signup = Signup.new
	end

	def create
		@signup = Signup.new(signup_params)

		if @signup.save
			flash[:si_notice] = "Signup created successfully!"
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
			flash[:si_notice] = "Signup edited successfully!"
			redirect_to admin_signup_path(@signup.id)
		else
			render :edit
		end
	end

	def destroy
		@signup = Signup.find(params[:id])
		
		if @signup.destroy
			flash[:si_notice] = "Signup deleted successfully!"
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