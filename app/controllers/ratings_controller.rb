class RatingsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def index
    @ratings = Rating.all
  end

  def show
    @rating = Rating.find_by_id(params[:id])
  end

  def new
    if params[:book_id] && @book = Book.find_by_id(params[:book_id])
      @rating = @book.ratings.new
    else
      @books = Book.all
      @rating = Rating.new
    end
  end

  def create
    @rating = current_user.ratings.build(rating_params)
    @rating.book_id = params[:book_id]
    if @rating.save
      redirect_to rating_path(@rating)
    else
      @book = Book.find_by_id(params[:book_id]) if params[:book_id]
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
