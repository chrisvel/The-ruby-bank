class ChangeColumnBalanceFromAccount < ActiveRecord::Migration

  def change
    change_column :accounts, :balance, :decimal, precision: 10, scale: 2
  end

end
