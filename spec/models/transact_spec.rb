require 'rails_helper'
require 'transact'

describe Transact do

  let(:user){ FactoryGirl.create :user }
  let(:jack){ FactoryGirl.create :jack }
  let(:peter){ FactoryGirl.create :peter }



  let(:transact){ FactoryGirl.create :transact }

  context "is valid" do

    it 'with an #amount, #from_user_id and #to_user_id' do
      expect(transact).to be_valid
    end

    it 'when transferring money' do
      transact = Transact.new
      amount = 100.01

      puts "*"*30
      puts "BEFORE"
      puts "Peter's account: #{peter.account.balance}"
      puts "Jack's account: #{jack.account.balance}"
      puts "Amount: #{amount}"
      puts "-"*30

      peter.account.debit(amount)
      jack.account.credit(amount)
      peter.account.save
      jack.account.save
      transact.from_user = peter
      transact.to_user = jack
      transact.amount = amount
      transact.save

      puts "*"*30
      puts "AFTER"
      puts "Peter's account: #{peter.account.balance}"
      puts "Jack's account: #{jack.account.balance}"
      puts "-"*30

      expect(transact).to be_valid
    end

  end

end
