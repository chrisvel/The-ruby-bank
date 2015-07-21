require 'rails_helper'
require 'user'

describe User do

  it "is valid with a firstname, lastname and email" do
    user = User.new(
      name: 'John Murdock',
      email: 'someone@somewhere.com')
      expect(contact).to be_valid
  end

end
