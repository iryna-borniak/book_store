require "rails_helper"

RSpec.describe Devise::SessionsController, type: :request do  
  let!(:user) { FactoryBot.create(:user) }
  let(:valid_attributes) { { email: user.email, password: user.password } }
  let(:invalid_attributes) { FactoryBot.attributes_for(:user, :wrong_password) }

  describe "GET #new" do
    it "renders a successful response" do
      get new_user_session_path

      expect(response).to be_successful
    end
  end
  
  describe "POST #create" do
    context "with valid parameters" do
      it "signes in user" do        
        post user_session_path, params: { user: valid_attributes }        

        expect(response).to be_redirect
        expect(flash[:notice]).to eq("Signed in successfully.")
      end
    end

    context "with invalid parameters" do
      it "does not sign in user" do        
        post user_session_path, params: { user: invalid_attributes }        

        expect(response).to be_unprocessable
        expect(flash[:alert]).to eq("Invalid Email or password.")
      end
    end
  end
  
  describe "DELETE #destroy" do
    it "signes out user" do      
      delete destroy_user_session_path      

      expect(response).to be_redirect
      expect(flash[:notice]).to eq("Signed out successfully.")
    end    
  end
end
