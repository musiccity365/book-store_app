class Book < ApplicationRecord
  has_many :ratings
  has_many :users, through: :ratings
  validates :title, :author, :publisher, :release_year, presence: true
 

  def self.book_list # helper_method :book_list
    '#{self.title} - #{self.release_year}'
  end

  def display_release_date
  end

  def self.ordered_by_release_date
  end
end
