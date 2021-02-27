class Book < ApplicationRecord
  has_many :ratings
  has_many :users, through: :ratings
  validates :title, presence: true
  validates :author, presence: true
  validates :publisher, presence: true
  validates :genre, presence: true
  
  # def book_list # helper_method :book_list
  #   "#{self.title} - #{self.release_year}"
  # end
  
  # def display_release_date
    
  # end
end
