class Admin::ExamsController < AdminController
	def index
		@exams = Exam.joins(:subject).search(params[:search])

		unless params[:filter].blank?
			@exams = Exam.joins(:subject).merge(Subject.where(year: 1)) if params[:filter] == 'year_1'
			@exams = Exam.joins(:subject).merge(Subject.where(year: 2)) if params[:filter] == 'year_2'
			@exams = Exam.joins(:subject).merge(Subject.where(year: 3)) if params[:filter] == 'year_3'
		end
	end

	def new
		@exam = Exam.new
	end

	def create
		@exam = Exam.new(exam_params)

		if @exam.save
			flash[:ex_notice] = "Exam created successfully!"
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
			flash[:ex_notice] = "Exam updated successfully!"
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
			flash[:ex_notice] = "Exam deleted successfully!"
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