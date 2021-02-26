class RatingsController < ApplicationController
  def show
    @rating = Rating.find(params[:id])
  end

  def new
    @rating = Rating.new(user_id)
  end

  def create
    @rating = Rating.new(params[:rating])
    if @rating.save
      flash[:success] = "Rating successfully created"
      redirect_to @rating
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
end
