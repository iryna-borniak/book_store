require "rails_helper"

RSpec.describe User, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let(:invalid_attribute) { FactoryBot.attributes_for(:user, :wrong_password) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }

  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to validate_uniqueness_of(:username).case_insensitive }
  
  it { is_expected.not_to allow_value(invalid_attribute).for(:password) }
end
