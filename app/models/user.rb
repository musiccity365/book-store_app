class User < ApplicationRecord
  has_many :ratings
  has_many :books, through: :ratings
  has_secure_password
  validates :email, uniqueness: true, on: :account_setup
  validates :username, uniqueness: true, on: :account_setup
  validates :name, presence: true, on: :account_setup
  
  def self.create_from_omniauth(auth)
      User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
          u.name = auth[:info][:name]
          u.username = auth[:info][:nickname]
          u.email = auth[:info][:email] || auth[:info][:nickname]
          u.password = SecureRandom.hex(16)
      end
  end 
end
