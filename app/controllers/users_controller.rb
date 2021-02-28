class UsersController < ApplicationController

  def index
    @user = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_path)
    if @user.save
      flash[:success] = "User successfully created"
      redirect_to users_path(@user)
    else
      flash[:error] = "Something went wrong"
      render :new
    end
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :username, :password)
    end
end
