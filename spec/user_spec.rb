require 'rails_helper'
require 'user'

describe User do

  it "is valid with a name, email and password" do
    user = User.new(
      name: 'John Murdock',
      email: 'someone@somewhere.com',
      password: 'password',
      password_confirmation: 'password')
      expect(user).to be_valid
  end

  it "is valid without a name" do
    user = User.new(
      name: '',
      email: 'someone@somewhere.com',
      password: 'password',
      password_confirmation: 'password')
      expect(user).to be_valid
  end

  it "is invalid without an email" do
    user = User.new(
      name: 'John Murdock',
      email: '',
      password: 'password',
      password_confirmation: 'password')
      expect(user).not_to be_valid
  end

  it "is invalid without a password" do
    user = User.new(
      name: 'John Murdock',
      email: 'someone@somewhere.com',
      password: '',
      password_confirmation: 'password')
      expect(user).not_to be_valid
  end

  it "is invalid without a password_confirmation" do
    user = User.new(
      name: 'John Murdock',
      email: 'someone@somewhere.com',
      password: 'password',
      password_confirmation: '')
      expect(user).not_to be_valid
  end

  it "is invalid without a password and a password_confirmation" do
    user = User.new(
      name: 'John Murdock',
      email: 'someone@somewhere.com',
      password: '',
      password_confirmation: 'password')
      expect(user).not_to be_valid
  end

end
