require "rails_helper"

describe "POST /api/v1/favorites" do

  it "creates a favorite for the user" do
    user = create(:user, password: "12345")

    params = {"location" => "Denver, CO", "api_key" => "#{user.api_key}"}

    post '/api/v1/favorites', :params => params

    expect(response.status).to eq(201)
    expect(user.favorites.length).to eq 1
    expect(user.favorites.first.location).to eq "Denver, CO"
  end

  it "renders 401 without valid API key" do
    user = create(:user, password: "12345")

    params = {"location" => "Denver, CO", "api_key" => "12345"}

    post '/api/v1/favorites', :params => params

    expect(response.status).to eq(401)
  end

end
