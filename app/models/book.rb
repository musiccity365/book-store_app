class Book < ApplicationRecord
  has_many :ratings
  has_many :users, through: :ratings
  accepts_nested_attributes_for :ratings

  validates :title, :author, :publisher, :release_year, presence: true
 

  def rating_attributes=(attr)
    binding.pry
  end
  def self.book_list # helper_method :book_list
    @books = []

    Book.all.each do |book|
      @book_info = [book.title, book.id]
      @books << @book_info
    end
    @books
  end

  def display_release_date
  end

  def self.ordered_by_release_year
    self.order(release_year: :desc)
  end
end
