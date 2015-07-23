require 'rails_helper'
require 'transact'

describe Transact do

  let(:peter_account) { FactoryGirl.create :peter_account }
  let(:jack_account) { FactoryGirl.create :jack_account }

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
      puts "Peter's account: #{peter_account.balance}"
      puts "Jack's account: #{jack_account.balance}"
      puts "Amount: #{amount}"
      puts "-"*30

      peter_account.debit(amount)
      jack_account.credit(amount)
      peter_account.save
      jack_account.save
      transact.from_user = peter_account.user
      transact.to_user = jack_account.user
      transact.amount = amount
      transact.save

      puts "*"*30
      puts "AFTER"
      puts "Peter's account: #{peter_account.balance}"
      puts "Jack's account: #{jack_account.balance}"
      puts "-"*30

      expect(transact).to be_valid
    end

  end

end
