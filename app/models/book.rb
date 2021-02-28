class Book < ApplicationRecord
  has_many :ratings
  has_many :users, through: :ratings
  validates :title, :author, :publisher, presence: true
  # validates

  def book_list # helper_method :book_list
    "#{self.title} - #{self.release_year}"
  end

  def display_release_date
  end
end
