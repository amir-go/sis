class PostsController < ApplicationController
	before_action :redirect_student, except: :show

	def index
		@posts = Post.all.where(user_id: current_user.id).paginate(:page => params[:page], :per_page => 5)
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
			flash[:post_notice] = 'Posted successfully!'
			redirect_to posts_path
		else
			flash[:post_error] = 'Error!'
			render :new
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		
		if @post.update_attributes(post_params)
			flash[:post_notice] = 'Post updated successfully!'
			redirect_to posts_path
		else
			flash[:post_error] = 'Error!'
			render :edit
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def destroy
		@post = Post.find(params[:id]).destroy

		if @post.destroy
			flash[:post_warning] = 'Post deleted successfully'
			render :edit
		else
			flash[:post_error] = 'Error!'
			render :edit
		end
	end

	private

	def post_params
		params.require(:post).permit(:title, :description)
	end
	
end