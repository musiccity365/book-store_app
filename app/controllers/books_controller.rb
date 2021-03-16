class BooksController < ApplicationController
  def new
    @book = Book.new
    @book.ratings.build
  end
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :publisher, :genre, :release_year)
  end

end
