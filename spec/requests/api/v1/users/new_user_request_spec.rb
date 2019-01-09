require "rails_helper"

describe "POST /api/v1/users" do

  it "creates a new user and returns an api key" do
    params = {email: "whatever@example.com", password: "password", password_confirmation: "password"}
    post "/api/v1/users", params: params

    user_response = JSON.parse(response.body)

    expect(response.status).to eq(201)
    expect(user_response).to have_key("api_key")
  end

  it "doesnt create a new user if passwords dont match" do
    params = {email: "whatever@example.com", password: "password", password_confirmation: "fds"}
    post "/api/v1/users", params: params
    #
    # user_response = JSON.parse(response.body)
    #
    expect(response.status).to eq(401)
  end

  it "doesnt create a new user if password confirmation is missing" do
    params = {email: "whatever@example.com", password: "password"}
    post "/api/v1/users", params: params
    #
    # user_response = JSON.parse(response.body)
    #
    expect(response.status).to eq(401)
  end
end
