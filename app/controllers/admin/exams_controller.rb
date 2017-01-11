class Admin::ExamsController < AdminController
	def index
		@exams = Exam.all
	end

	def new
		@exam = Exam.new
	end

	def create
		@exam = Exam.new(exam_params)

		if @exam.save
			flash[:notice] = "Exam created succesfully!"
			redirect_to admin_exams_path
		else
			render :new
		end
	end

	def edit
		@exam = Exam.find(params[:id])
	end

	def update
		@exam = Exam.find(params[:id])

		if @exam.update_attributes(exam_params)
			flash[:notice] = "Exam updated succesfully!"
			redirect_to admin_exams_path
		else
			render :edit
		end
	end

	def destroy
		@exam = Exam.find(params[:id]).destroy
		Signup.where(exam_id: @exam.id).each do |s|
			s.destroy
		end

		if @exam.destroy
			flash[:notice] = "Exam deleted succesfully!"
			redirect_to admin_exams_path
		else
			redirect_to admin_exams_path
		end
	end

	private

	def exam_params
		params.require(:exam).permit(:subject_id, :professor_id, :start_date, :department)
	end
end