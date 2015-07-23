class Account < ActiveRecord::Base

  belongs_to :user

  validates :name, presence: true, length: { maximum: 250 }
  validates :balance, presence: true, :numericality => { :greater_than => 0 }
  validates :user_id, presence: true

  # to make private

  def debit(amount)
    self.balance -= amount
  end

  def credit(amount)
    self.balance += amount
  end

end
