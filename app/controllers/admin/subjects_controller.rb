class Admin::SubjectsController < AdminController
	def index
		@subjects = Subject.all
		@third_year = Subject.where(year: 3)
		@second_year = Subject.where(year: 2)
		@first_year = Subject.where(year: 1)
	end

	def new
		@subject = Subject.new
	end

	def create
		@subject = Subject.new(subject_params)

		if @subject.save
			flash[:notice] = "Subject created succesfully!"
			redirect_to admin_subjects_path
		else
			render :new
		end
	end

	def edit
		@subject = Subject.find(params[:id])
	end

	def update
		@subject = Subject.find(params[:id])

		if @subject.update_attributes(subject_params)
			flash[:notice] = "Subject edited!"
			render :edit
		else
			render :edit
		end
	end

	def destroy
		@subject = Subject.find(params[:id]).destroy

		if @subject.destroy
			flash[:notice] = "Subject deleted!"
			redirect_to admin_subjects_path
		else
			redirect_to admin_subjects_path
		end
	end

	private

	def subject_params
		params.require(:subject).permit(:name, :ects, :year)
	end
end