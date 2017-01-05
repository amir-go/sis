class PostsController < ApplicationController
	def index
		@posts = Post.all.where(user_id: current_user.id)
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
			redirect_to posts_path
		else
			render :new
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		
		if @post.update_attributes(post_params)
			redirect_to posts_path
		else
			render :edit
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	private

	def post_params
		params.require(:post).permit(:title, :description)
	end
end