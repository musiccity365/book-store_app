class Book < ApplicationRecord
  has_many :ratings
  has_many :users, through: :ratings
  accepts_nested_attributes_for :ratings

  validates :title, :author, :publisher, :genre, :release_year, presence: true

  def self.book_list # helper_method :book_list
    @books = []

    Book.all.each do |book|
      @book_info = [book.title, book.id]
      @books << @book_info
    end
    @books
  end

end
