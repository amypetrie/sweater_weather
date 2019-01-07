require "rails_helper"

describe "POST /api/v1/sessions" do

  it "returns the users api key" do
    user = create(:user, password: "12345")

    headers = {"Accept" => "application/json", "Content-Type" => "application/json"}
    params = {"email" => "#{user.email}", "password" => "12345"}
    
    post '/api/v1/sessions', :params => params

    user_response = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(user_response).to have_key("api_key")
    expect(user_response["api_key"]).to eq user.api_key
  end

end
