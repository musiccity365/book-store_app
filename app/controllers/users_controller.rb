class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "User successfully created"
      redirect_to @user
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  def update
    @rating = Rating.find(params[:id])
      if @rating.update_attributes(params[:rating])
        flash[:success] = "Rating was successfully updated"
        redirect_to @rating
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  



end
