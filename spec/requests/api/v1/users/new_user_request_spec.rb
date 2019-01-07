require "rails_helper"

describe "POST /api/v1/users" do

  it "returns an api key" do

  # stub_request(:post, "localhost:3000/api/v1/users").
  #   with(body: {"email": "whatever@example.com", "password": "password", "password_confirmation": "password"}, headers: { 'Content-Type:' => 'application/json', 'Accept:' => 'application/json' }).
  #   to_return(body: File.read("./spec/fixtures/api/v1/users/create_account_response.json"))

    params = {email: "whatever@example.com", password: "password", password_confirmation: "password"}
    post "/api/v1/users", params: params

    user_response = JSON.parse(response.body)

    expect(response.status).to eq(201)
    expect(user_response).to have_key("api_key")
  end

end
