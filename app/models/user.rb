class User < ApplicationRecord
  has_many :ratings
  has_many :books, through: :ratings
  # use uniqueness for login credential validations
end
