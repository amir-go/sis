class SignupsController < ApplicationController
	def create
		@signup = Signup.new(signup_params)

		if @signup.save
			flash[:notice] = "Signed up successfully!"
			redirect_to exams_path
		else
			flash[:error] = "For some reason you cant' signup for exam!"
			redirect_to exams_path
		end
	end

	def destroy
		@signup = Signup.find(params[:id]).destroy

		if @signup.destroy
			flash[:notice] = "Signup canceled successfully!"
			redirect_to exams_path
		else
			flash[:error] = "You can't cancel the signup!"
			redirect_to exams_path			
		end
	end

	private

	def signup_params
		params.require(:signup).permit(:exam_id, :user_id)
	end

end