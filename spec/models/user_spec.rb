require 'rails_helper'
require 'user'

describe User do

  let :user do
    FactoryGirl.build :user
  end

  subject do
   user
  end

  context 'is valid' do

    it "with a #name, #email and #password" do
      expect(user).to be_valid
    end

    it "without a #name" do
      user.name = ''
      expect(user).to be_valid
    end

  end

  context 'is invalid' do

    it "with a long #name" do
      user.name = 'uriu7nbvckeuruvwuevwevih2o84o2ijeqilqievubv'
      expect(user).not_to be_valid
    end

    it "without an #email" do
      user.email = ''
      expect(user).not_to be_valid
    end

    it "with a very long #email" do
      user.email =  'sfgwfgnsfjsdsdwrKWEFHWUERGUHWKERUGHWEBVKJDBVKWUHERUGHQWUKEHKVJADBKVJAKDEFKQUEUQKLIEHFLWIHROGIHWO8ROGWIRIVSLDKVLSIDHVLISDKLVJBSKJDBKVJKHDKHWQUEHKUWQHKLDJVSJDVKLSJDHVHlijldsfigoeirlgknsfknvlsfboiwoirglwirlksndkvsladhvliwhrogiwlrkgskdfnvskdflvishfoibhslfbskfnbksflbhlsfkhlb35445y3484ot83482384o8ty348t4to284ytow8yrog8fDVBAKJDBVKAUSKUGWIUERHVQIHDKLVAHKDUHVWUERHGUQVHEDKVJAKDVKQWUERHGKWUREBKVUASBDKVUAEHWQIEUHFKAUDHVCKAUDHKVUHAEKFUHAKDUVHgwefdfdfdfjekrjfgkjsfbv@sksuhfuhvsuhfvkjsbdv.dfees'
      expect(user).not_to be_valid
    end

    it "with a wrong formatted #email" do
      user.email =  'sf@#$@$%$^^dfjekrjfgkjsfbv@%%%%hfuhvs...d@e((es'
      expect(user).not_to be_valid
    end

    it "without a #password" do
      user.password = ''
      expect(user).not_to be_valid
    end

    it "without a #password_confirmation" do
      user.password_confirmation = ''
      expect(user).not_to be_valid
    end

    it "without a #password and a #password_confirmation" do
      user.password = ''
      user.password_confirmation = ''
      expect(user).not_to be_valid
    end

    it "if #email is already exists" do
      user.save
      user1 = build :user
      user1.save

      expect(user).to be_valid
      expect(user1).to have_valid(:email)
    end

  end

end
