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

    it 'without a #user_id' do
      account.user_id = ''
      expect(account).not_to be_valid
    end



  end

  context ".transfer" do

    it "allows tranfer of money between accounts" do

      transtat = transfer(:peter_account, :jack_account, 100.01)
      expect(transtat).to be_valid

    end

  end

end
