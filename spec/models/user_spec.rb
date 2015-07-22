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

    it 'with a .name, .email and .password' do
      expect(user).to be_valid
    end

    it 'without a .name' do
      user.name = ''
      expect(user).to be_valid
    end

    it 'and authenticates with the right .password' do
      expect(user.authenticate('12345678')).to be_valid
    end

  end

  context 'is invalid' do

    it 'with a long .name' do
      user.name = 'uriu7nbvckeuruvwuevwevih2o84o2ijeqilqievubv'
      expect(user).not_to be_valid
    end

    it 'without an .email' do
      user.email = ''
      expect(user).not_to be_valid
    end

    it 'with a very long .email' do
      user.email =  'sfgwfgnsfjsdsdwrKWEFHWUERGUHWKERUGHWEBVKJDBVKWUHERUGHQWUKEHKVJADBKVJAKDEFKQUEUQKLIEHFLWIHROGIHWO8ROGWIRIVSLDKVLSIDHVLISDKLVJBSKJDBKVJKHDKHWQUEHKUWQHKLDJVSJDVKLSJDHVHlijldsfigoeirlgknsfknvlsfboiwoirglwirlksndkvsladhvliwhrogiwlrkgskdfnvskdflvishfoibhslfbskfnbksflbhlsfkhlb35445y3484ot83482384o8ty348t4to284ytow8yrog8fDVBAKJDBVKAUSKUGWIUERHVQIHDKLVAHKDUHVWUERHGUQVHEDKVJAKDVKQWUERHGKWUREBKVUASBDKVUAEHWQIEUHFKAUDHVCKAUDHKVUHAEKFUHAKDUVHgwefdfdfdfjekrjfgkjsfbv@sksuhfuhvsuhfvkjsbdv.dfees'
      expect(user).not_to be_valid
    end

    it 'with a wrong formatted .email' do
      user.email =  'sf@.$@$%$^^dfjekrjfgkjsfbv@%%%%hfuhvs...d@e((es'
      expect(user).not_to be_valid
    end

    it 'without a .password' do
      user.password = ''
      user.password_confirmation = ''
      expect(user).not_to be_valid
    end

    it 'without a .password_confirmation' do
      user.password_confirmation = ''
      expect(user).not_to be_valid
    end

    it 'without a .password and a .password_confirmation' do
      user.password = ''
      user.password_confirmation = ''
      expect(user).not_to be_valid
    end

    it 'when .email is not unique' do
      user.save
      user1 = FactoryGirl.build :user
      user1.save

      expect(user1).not_to be_valid

    end

    it 'when .password is too short' do
      user.password = '123'
      user.password_confirmation = '123'
      expect(user).not_to be_valid
    end

    it 'when authenticating with the wrong .password' do
      expect(user.authenticate('453t3trg')).to be_falsey
    end

  end

  it '.email must never change after its initial creation' do
    user.update_attributes email: 'oh@yeah.com'
    user.save
    expect(user.reload).not_to eql('oh@yeah.com')
  end

  it 'is valid' do
    expect(user).to be_valid
  end

end
