class RatingsController < ApplicationController
  before_action :redirect_if_not_logged_in
  before_action :require_user_access, only: [:edit, :update, :destroy]
  

  def index
    if params[:book_id] && @book = Book.find_by_id(params[:book_id])
      @ratings = @book.ratings
    else
      @ratings = Rating.all
    end
  end

  def show
    @rating = Rating.find_by_id(params[:id])
  end

  def new
    if params[:book_id] && @book = Book.find_by_id(params[:book_id])
      @rating = @book.ratings.new
    else
      @books = Book.book_list
      @rating = Rating.new
    end
  end

  def create
    @rating = current_user.ratings.build(rating_params)
    @rating.book_id = params[:book_id] || @rating.book_id = params[:rating][:book_id]
    if @rating.save
      redirect_to rating_path(@rating)
    else
      @book = Book.find_by_id(params[:book_id]) if params[:book_id]
      @books = Book.book_list
      flash[:message] = @rating.errors.full_messages.join(", ")

      render :new
    end
  end

  def edit
    @rating = Rating.find(params[:id])
    @books = Book.book_list
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
    params.require(:rating).permit(:title, :content, :score, :book_id, :user_id) # check later
  end
  
  def require_user_access
    rating = Rating.find_by(id: params[:id])
    unless rating && current_user.id == rating.user_id
      flash[:error] = "Sorry, Access Denied."
      redirect_to user_path(current_user)
    end
  end

end
