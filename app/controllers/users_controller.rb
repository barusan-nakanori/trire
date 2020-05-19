class UsersController < ApplicationController
	before_action :authenticate_user!
  def index
  	@users = User.all
  	@book = Book.new
  end

  def show
  	@user = User.find(params[:id])
  	@book = Book.new
    @books = Book.where(user_id: @user.id)
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
  	   redirect_to user_path(@user.id)
    else
       render "users/edit"
    end
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :profile_image)
  	end
end
