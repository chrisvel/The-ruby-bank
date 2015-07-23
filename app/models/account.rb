class Account < ActiveRecord::Base

  belongs_to :user

  validates :name, presence: true, length: { maximum: 250 }
  validates :balance, presence: true
  validates :user_id, presence: true

end
