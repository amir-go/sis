class Admin::ProfessorsController < AdminController
	def index
		@professors = Professor.all
	end

	def new
		@professor = Professor.new
	end

	def create
		@professor = Professor.new(professor_params)
	end

	def edit
		@professor = Professor.find(params[:id])
	end

	def update
		@professor = Professor.find(params[:id])
		
		if @professor.update_attributes(professor_params)
			flash[:notice] = "Professor updated!"
			render :edit
		else
			render :edit
		end
	end

	def show
		@professor = Professor.find(params[:id])
	end

	private

	def professor_params
		params.require(:professor).permit(:first_name, :last_name, :title)
	end
end