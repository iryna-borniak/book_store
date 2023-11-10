require "rails_helper"

RSpec.describe Devise::RegistrationsController, type: :request do  
  let!(:user) { FactoryBot.create(:user) }
  let(:valid_attributes) { FactoryBot.attributes_for(:user) }
  let(:invalid_attributes) { FactoryBot.attributes_for(:user, :wrong_password) }

  describe "GET #new" do
    it "renders a successful response" do
      get new_user_registration_path

      expect(response).to be_successful
    end
  end
  
  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new User and redirects" do
        expect do
          post user_registration_path, params: { user: valid_attributes }
        end.to change(User, :count).by(1)

        expect(response).to be_redirect
        expect(flash[:notice]).to eq("Welcome! You have signed up successfully.")
      end
    end

    context "with invalid parameters" do
      it "does not create a new User" do
        expect do
          post user_registration_path, params: { user: invalid_attributes }
        end.not_to change(User, :count)

        expect(response).to be_unprocessable
      end
    end
  end
end
