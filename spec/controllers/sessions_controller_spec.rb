require 'rails_helper'

describe SessionsController, :type => :controller do

  let! :user do
    FactoryGirl.create :user
  end

  subject do
   user
  end

  describe "GET #new" do
    before(:each) { get :new }

    it "returns http success" do
      expect(response).to have_http_status(:ok)
    end

    it "returns 'new' template" do
      expect(response).to render_template('sessions/new')
    end

  end

  describe "POST #create" do

    it "creates an authenticated user session" do
      get :new
      post :create, session: { email: user.email, password: user.password }
      expect(session[:user_id]).to eq(user.id)
    end

    it "returns http success" do
      expect(response).to have_http_status(:ok)
    end

  end



end
