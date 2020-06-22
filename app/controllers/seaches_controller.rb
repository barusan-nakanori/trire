class SeachesController < ApplicationController

	def seach
		@user_or_book = params[:option]
		if @user_or_book == "1"
			@users = User.search(params[:search, @user_or_book])
		else
			@book = Book.search(params[:search, @user_or_book])
		end
	end
end
