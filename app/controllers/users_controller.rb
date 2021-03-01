class UsersController < ApplicationController

  def index
    render :login
  end

  def new
    redirect_to '/signup'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user_id
      redirect_to users_path(@user)
    else
      render :new
    end
  end

  def show
    redirect_if_not_logged_in
    @user = User.find_by_id(params[:id])
    redirect_to '/' if !@user
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
