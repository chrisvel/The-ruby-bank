class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.decimal :balance
      t.integer :user_id
      t.foreign_key :users

      t.timestamps null: false
    end
  end
end
