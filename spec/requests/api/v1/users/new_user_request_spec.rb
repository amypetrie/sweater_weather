require "rails_helper"

describe "POST /api/v1/users" do

  it "returns an api key" do

    # stub_request(:get, /localhost/).
    #   to_return(body: File.read("./spec/fixtures/dark_sky_results.json"))

    post '/api/v1/users'

    # {
    #   "email": "whatever@example.com",
    #   "password": "password"
    #   "password_confirmation": "password"
    # }

    response_back = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
  end

end
