class RatingsController < ApplicationController
  def index
    @rating = Rating.all
  end

  def show
    @rating = Rating.find(params[:id])
  end

  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(params[:rating])
    if @rating.save
      redirect_to rating_path(@rating)
    else
      render :new
    end
  end

  def edit
    @rating = Rating.find(params[:id])
  end

  def update
    rating = Rating.find(params[:id])
    rating.update(rating_params)
    redirect_to rating_path(rating)
  end

  def destroy
    rating = Rating.find(params[:id])
    rating.destroy(rating_params)
    redirect_to rating_path
  end

  private

  def rating_params
    params.require(:rating).permit(:comment, :score, :book_id, :user_id)
  end

end
