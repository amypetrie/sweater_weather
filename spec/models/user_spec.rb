require 'rails_helper'

RSpec.describe User, type: :model do
  it "exists" do
    user = create(:user)

    expect(user).to be_a User
    expect(user.api_key).to be_a String
    expect(user.api_key.length).to eq 28
  end
end
