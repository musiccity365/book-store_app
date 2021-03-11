class SessionsController < ApplicationController
  # skip_before_action :require_login, only: [:new, :create, :welcome]

  def welcome
  end

  def destroy
    session.clear
    redirect_to root_path
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password]) # authenticate method comes from has_secure_password
      session[:user_id] = user.id # logs in a user
      redirect_to user_path(user)
    else
      flash[:message] = "Invalid credentials, please try again!"
      redirect_to '/login'
    end
  end
  
  def destroy
    session.delete(:user_id)
    redirect_to '/login'
  end

  def omniauth
    #find or create a user using the attributes auth
    user = User.create_from_omniauth(auth)
    if user.valid?
      session[:user_id] = user.id
      redirect_to new_rating_path
    else
      flash[:message] = user.errors.full_messages.join("")
      redirect_to ratings_path
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
