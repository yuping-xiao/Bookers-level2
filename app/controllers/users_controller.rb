class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
  		@user = User.find(params[:id])
      #@user = current_user
      @book = Book.new
      @books = @user.books # [<book instance>, ...]
  end

  def index
      @user = current_user
  		@users = User.all # [<user instance>, ...]
      @book = Book.new
  end

  def edit
  		@user = User.find(params[:id])
  end

  def update
  		@user = User.find(params[:id])
  		if @user.update(user_params)
        flash[:notice] = "you have updated user successfullyy"
  		  redirect_to user_path(@user.id)
      else
        render 'edit'
      end
  end

  private
  def user_params
  		params.require(:user).permit(:username, :introduction, :profile_image)
  end
end
