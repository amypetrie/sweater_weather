require "rails_helper"

describe "POST /api/v1/users" do

  it "returns an api key" do
    params = {email: "whatever@example.com", password: "password", password_confirmation: "password"}
    post "/api/v1/users", params: params

    user_response = JSON.parse(response.body)

    expect(response.status).to eq(201)
    expect(user_response).to have_key("api_key")
  end

end
