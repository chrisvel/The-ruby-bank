require 'rails_helper'
require 'account'

describe Account do

  let(:account){ FactoryGirl.create :account }
  let(:peter_account) { FactoryGirl.create :peter_account }
  let(:jack_account) { FactoryGirl.create :jack_account }

  context "is valid" do

    it 'with a #name, #balance and #user_id' do
      expect(account).to be_valid
    end

  end

  context "is invalid" do

    it 'without a #name' do
      account.name = ''
      expect(account).not_to be_valid
    end

    it 'with a very long #name' do
      account.name =  'sfgwfgnsfjsdsdwrKWEFHWUERGUHWKERUGHWEBVKJDBVKWUHERUGHQWUKEHKVJADBKVJAKDEFKQUEUQKLIEHFLWIHROGIHWO8ROGWIRIVSLDKVLSIDHVLISDKLVJBSKJDBKVJKHDKHWQUEHKUWQHKLDJVSJDVKLSJDHVHlijldsfigoeirlgknsfknvlsfboiwoirglwirlksndkvsladhvliwhrogiwlrkgskdfnvskdflvishfoibhslfbskfnbksflbhlsfkhlb35445y3484ot83482384o8ty348t4to284ytow8yrog8fDVBAKJDBVKAUSKUGWIUERHVQIHDKLVAHKDUHVWUERHGUQVHEDKVJAKDVKQWUERHGKWUREBKVUASBDKVUAEHWQIEUHFKAUDHVCKAUDHKVUHAEKFUHAKDUVHgwefdfdfdfjekrjfgkjsfbv@sksuhfuhvsuhfvkjsbdv.dfees'
      expect(account).not_to be_valid
    end

    it 'without a #balance' do
      account.balance = ''
      expect(account).not_to be_valid
    end

  end

  context "transaction" do

    context "allows" do

      it "adding credit to account" do
        after_balance = account.balance + 100.01
        account.credit(100.01)
        account.save
        expect(account.balance).to eq(after_balance)
      end

      it "adding debit to account" do
        after_balance = account.balance - 100.01
        account.debit(100.01)
        account.save
        expect(account.balance).to eq(after_balance)
      end

    end

    context "denies" do

      it "to complete with a negative balance" do
        account.debit(1000.01)
        account.save
        expect(account).not_to be_valid
        expect(account.errors[:balance]).not_to be_nil
        expect(account.errors[:balance]).to include("must be greater than 0")
      end

      it "to complete with wrong amount of arguments" do
        expect{account.debit(11.000,22)}.to raise_error(ArgumentError)
      end

      it "to complete with wrong formatted balance" do
        expect{account.debit('3rg3grwe')}.to raise_error(TypeError)
      end

    end

  end

end
