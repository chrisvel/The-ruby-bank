class User < ActiveRecord::Base

  has_secure_password

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 250 },
                    format: { with: EMAIL_REGEX }

end
