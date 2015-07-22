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


    context "is valid" do

      it "when creates an authenticated user session" do
        post :create, session: { email: user.email, password: user.password }
        expect(session[:user_id]).to eq(user.id)
      end

    end

    context "is not valid" do

      it "when fails to authenticate with an empty password" do
        post :create, session: { email: user.email, password: '' }
        expect(session[:user_id]).not_to eq(user.id)
      end

      it "when fails to authenticate with a wrong password" do
        post :create, session: { email: user.email, password: '/@#%@#eeffs' }
        expect(session[:user_id]).not_to eq(user.id)
      end

      it "when fails to authenticate with nil crends" do
        post :create, session: { email: '', password: '' }
        expect(session[:user_id]).not_to eq(user.id)
      end

      it "when fails to authenticate with wrong account" do
        post :create, session: { email: 'me@you.com', password: 'hackme' }
        expect(session[:user_id]).not_to eq(user.id)
      end

    end

    it "returns http success" do
      expect(response).to have_http_status(:ok)
    end

  end

  describe "DELETE #destroy" do

    it "when logs out of an authenticated user session" do
      post :create, session: { email: user.email, password: user.password }
      expect(session[:user_id]).to eq(user.id)
      delete :destroy
      expect(session[:user_id]).to be_nil
    end

  end

end
