require 'rails_helper'

describe TransactsController, :type => :controller do

  let(:transact){ FactoryGirl.create :transact }

  describe "POST #create" do

    context "is valid" do

      it "when transferring funds" do
        # puts peter_account.inspect
        post :create, transact: transact.attributes
        expect(response).to have_http_status(:ok)
      end

    end

    context "is not valid" do

    end

    it "returns http success" do
      expect(response).to have_http_status(:ok)
    end

  end

end
