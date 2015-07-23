class CreateTransacts < ActiveRecord::Migration
  def change
    create_table :transacts do |t|
      t.decimal :amount, precision: 10, scale: 2
      t.integer :from_user_id, :null => false
      t.integer :to_user_id, :null => false
      t.foreign_key :users, :column => :from_user_id, :dependent => :delete
      t.foreign_key :users, :column => :to_user_id, :dependent => :delete

      t.timestamps null: false
    end
  end
end
