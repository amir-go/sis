class HomeController < ApplicationController
	def index
		@posts = Post.search(params[:search]).order(created_at: :desc).paginate(:page => params[:page], :per_page => 5)
	end
end