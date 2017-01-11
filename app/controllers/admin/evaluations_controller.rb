class Admin::EvaluationsController < AdminController
	def index
		@evaluations = Evaluation.joins(:user).search(params[:search]).paginate(:page => params[:page], :per_page => 5)
	end

	def show
		@evaluation = Evaluation.find(params[:id])
	end

	def new
		@evaluation = Evaluation.new
	end

	def create
		@evaluation = Evaluation.new(evaluations_params)

		if @evaluation.save
			flash[:ev_notice] = "Evaluation created successfully!"
			render :new
		else
			flash[:ev_error] = "Error! Student already have grade from that subject!"
			render :show
		end
	end

	def edit
		@evaluation = Evaluation.find(params[:id])
	end

	def update
		@evaluation = Evaluation.find(params[:id])
		
		if @evaluation.update_attributes(evaluations_params)
			flash[:ev_notice] = "Successfully updated!"
			render :edit
		else
			flash[:ev_error] = "Successfully updated!"
			render :edit
		end
	end

	private

	def evaluations_params
		params.require(:evaluation).permit(:user_id, :subject_id, :evaluation)
	end
end