class UsersController < ApplicationController
  before_action :require_user_access, only: [:edit, :update, :show]
  skip_before_action :require_login, only: [:new, :omniauth, :create]

  def new
    @user = User.new
  end

  def omniauth
    #find or create a user using the attributes auth
    user = User.create_from_omniauth(auth)
    if user.valid?
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:message] = "Invalid Entry, please try again!"
      redirect_to login_path
    end
  end

  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user_id
      redirect_to @user
    else
      render :new
    end
  end
  
  def show
    
    binding.pry
    
    redirect_if_not_logged_in
    @user = User.find_by_id(params[:id])
    redirect_to '/' if !@user
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
  def require_user_access
    user = User.find_by(id: params[:id])
    unless user && current_user.id == user.id
      flash[:error] = "Sorry, Access Denied."
      redirect_to user_path(current_user)
    end
  end
  
  def auth
    request.env['omniauth.auth']
  end
end
