class User < ActiveRecord::Base

  has_secure_password

  attr_readonly :email

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 250 },
                    format: { with: EMAIL_REGEX },
                    uniqueness: true
  validates :password, length: { minimum: 8 }

  has_one :account

end
