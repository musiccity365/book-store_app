module ApplicationHelper
  # gives access to the views
  # helper_method :current_user, :logged_in?
  # before_action :require_login
  

  
  def require_login
      unless logged_in?
        flash[:error] = "You must be logged in to access this section"
        redirect_to login_path
      end
  end
  def nav_bar
    menu = ''
    if logged_in?
      menu << '<a href="' + user_path(current_user.id) + '">Profile</a>&nbsp'
      menu << '<a href="' + books_path + '">Books</a>&nbsp'
      menu << '<a href="' + ratings_path + '">Ratings</a>&nbsp'
      menu << '<a href="' + logout_path + '">Logout</a>&nbsp'
    end
    menu.html_safe
  end
  def current_user
      #we don't use @user because it might override the user
      # variable in the controller
  
      # 1. if there is a session[:user_id] proceed..
      # ....(we don't want to make a call to the database
      # & not find anything)
      # 2. if @current_user already exists then set the user to @current_user
      # 3. if not, find user by user_id in the users table and set
      # to @current_user.
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
    
  def logged_in?
      !!current_user
  end

end
