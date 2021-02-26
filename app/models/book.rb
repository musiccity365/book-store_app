class Book < ApplicationRecord
  has_many :ratings
  has_many :users, through: :ratings
  
  def title_and_rating # helper_method :title_and_rating
    "#{self.title} - #{self.rating}"
  end
  
  def display_release_date
    
  end
end
