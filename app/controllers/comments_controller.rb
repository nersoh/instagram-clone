class CommentsController < ApplicationController

	def show
		
	end

	def create
		params[:comment][:user_id] = current_user.id
		picture = Picture.find(params[:comment][:picture_id])
		comment = picture.comments.build(comment_params)
		if comment.save
			redirect_to picture
		else
			render nothing: true
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:picture_id, :content, :user_id)
	end
end
