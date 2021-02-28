class User < ApplicationRecord
  has_many :ratings
  has_many :books, through: :ratings
  has_secure_password # macro
  validates :username, presence: :true # - active record validations - validates that a username is present using AR
  validates :username, uniqueness: :true # - active record validations - validates that a username is unique and does not already exist using AR
end
