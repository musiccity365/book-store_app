class RatingsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @rating = Rating.all
  end

  def show
    @rating = Rating.find_by_id(params[:id])
  end

  def new
    @rating = Rating.new
    @rating.build_book
  end



  def create
    @rating = current_user.ratings.new(rating_params)
    if @rating.valid?
      @rating.save
      redirect_to ratings_path(@rating)
    else
      render :new
    end
  end

  def edit
    @rating = Rating.find(params[:id])
  end

  def update
    if logged_in?
      @rating = Rating.find(params[:id])
      @rating.update(rating_params)
      flash[:success] = "Updated!"
      redirect_to ratings_path(@rating)
    else
      render action: :edit
    end
  end

  def destroy
    @rating = current_user.ratings.find(params[:id])
    @rating.destroy
    redirect_to ratings_path
    flash[:notice] = "Deleted!"
  end

  private

  def rating_params
    params.require(:rating).permit(:comment, :score, :book_id, :user_id) # check later
  end

end
