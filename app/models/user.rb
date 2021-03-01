class User < ApplicationRecord
  has_many :ratings
  has_many :books, through: :ratings
  has_secure_password
  validates :email, uniqueness: true, on: :account_setup
  validates :username, uniqueness: true, on: :account_setup
  validates :name, presence: true, on: :account_setup
end
