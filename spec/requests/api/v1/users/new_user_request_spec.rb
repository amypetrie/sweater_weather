require "rails_helper"

describe "POST /api/v1/users" do

  it "returns an api key" do

    # stub_request(:post, "localhost:3000/api/v1/users").
    #   with(body: {"email": "whatever@example.com", "password": "password", "password_confirmation": "password"}, headers: { 'Content-Type:' => 'application/json', 'Accept:' => 'application/json' }).
    #   to_return(body: File.read("./spec/fixtures/api/v1/users/create_account_response.json"))
    #
    # post '/api/v1/users'
    # # {"email": "whatever@example.com", "password": "password", "password_confirmation": "password"}
    #
    # response_back = JSON.parse(response.body)
    #
    # expect(response).to be_successful
    post "/api/v1/users", params: {
                                email: "whatever@example.com",
                                password: "password",
                                password_confirmation: "password"
                              }
                              user_json= JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(201)
    expect(user_json).to have_key(:api_key)
  end

end
