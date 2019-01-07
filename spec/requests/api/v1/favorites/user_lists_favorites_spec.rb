require "rails_helper"

describe "GET /api/v1/favorites" do

  it "creates a favorite for the user" do
    user = create(:user)
    user.favorites.create(location: "Denver, CO")
    user.favorites.create(location: "Chicago, IL")

    params = {"api_key" => "#{user.api_key}"}

    get '/api/v1/favorites', :params => params

    user_response = JSON.parse(response.body)

    expect(response.status).to eq(200)
    expect(user_response).to be_an Array
    expect(user_response.length).to eq 2
  end

end
