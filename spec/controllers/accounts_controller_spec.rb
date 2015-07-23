require 'rails_helper'

describe AccountsController, :type => :controller do

  let! :account do
    FactoryGirl.create :account
  end

  subject do
   account
  end

  describe "GET #new" do
    before(:each) { get :new }

    it "returns http success" do
      expect(response).to have_http_status(:ok)
    end

  end
end
