class UsersController < ApplicationController
	before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def index
  	@users = User.all
  	@book = Book.new
    @follower = Relationship.where(follower_id: params[:id]).all
    @followed = Relationship.where(followed_id: params[:id]).all
  end

  def show
  	@user = User.find(params[:id])
  	@book = Book.new
    @books = Book.where(user_id: @user.id)
    @follower = Relationship.where(follower_id: params[:id]).all
    @followed = Relationship.where(followed_id: params[:id]).all
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
  		params.require(:user).permit(:name, :profile_image, :introduction)
  	end

    def correct_user
      @user = User.find(params[:id])
      redirect_to user_path(current_user) unless @user == current_user
    end

end
