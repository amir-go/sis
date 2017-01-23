class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.new(comment_params)
		@comment.save
		
		respond_to do |format|
			if @comment.ancestry.present?
				format.html do 
					redirect_to post_path(@post.id)
				end
			else
				format.js
			end
		end
	end

	def destroy
		@comment = Comment.find(params[:id]).destroy
		@post = Post.find(params[:post_id])

		if @comment.destroy
			flash[:comment_notice] = "Comment deleted successfully!"
			redirect_to post_path(@post.id)
		end
	end

	private

	def comment_params
		params.permit(:content, :ancestry, :post_id).merge(user_id: current_user.id)
	end
end