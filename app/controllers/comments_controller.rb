class CommentsController < ApplicationController
	before_action :correct_user, only: [:destroy]

	def create
		book = Book.find(params[:book_id])
		@comment = book.comments.build(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			redirect_back(fallback_location: root_path)
		else
			redirect_back(fallback_location: root_path)
		end
	end

	def destroy
		comment = Comment.find(params[:id])
		comment.destroy
		redirect_back(fallback_location: root_path)
	end

	private
		def comment_params
			params.require(:comment).permit(:content)
		end

		def correct_user
    		comment = Comment.find(params[:id])
    		book = Book.find(params[:book_id])
    		unless comment.user == current_user
      			redirect_to book_path(book)
      		end
      	end
end
