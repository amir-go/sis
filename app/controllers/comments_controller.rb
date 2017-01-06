class CommentsController < ApplicationController
	def create
		@comment = Comment.create(comment_params)

		respond_to do |format|
			format.js
		end
	end

	private

	def comment_params
		params.permit(:content, :post_id).merge(user_id: current_user.id)
	end
end