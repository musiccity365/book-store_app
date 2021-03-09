class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :welcome]

  def welcome
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:message] = "Incorrect credentials, please try again!"
      redirect_to "/login"
    end
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

  private

  def auth
    request.env['omniauth.auth']
  end

end
