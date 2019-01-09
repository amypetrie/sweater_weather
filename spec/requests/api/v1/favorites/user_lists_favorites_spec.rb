require "rails_helper"

describe "GET /api/v1/favorites" do

  it "creates a favorite for the user" do
    user = create(:user)
    user.favorites.create(location: "Denver, CO")
    user.favorites.create(location: "Chicago, IL")

    params = {"api_key" => "#{user.api_key}"}

    get '/api/v1/favorites', :params => params

    user_response = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(user_response).to have_key :data
    expect(user_response[:data]).to be_an Array
    expect(user_response[:data].length).to eq 2
    expect(user_response[:data].first).to have_key :attributes
    expect(user_response[:data].first[:attributes]).to have_key :weather_data
    expect(user_response[:data].first[:attributes][:weather_data]).to have_key :data
    expect(user_response[:data].first[:attributes][:weather_data][:data]).to have_key :attributes
    expect(user_response[:data].first[:attributes][:weather_data][:data][:attributes]).to have_key :daily_forecast
    expect(user_response[:data].first[:attributes][:weather_data][:data][:attributes]).to have_key :hourly_forecast
    expect(user_response[:data].first[:attributes][:weather_data][:data][:attributes]).to have_key :upcoming_forecast
  end

  it "renders 401 without valid API key" do
    user = create(:user)
    user.favorites.create(location: "Denver, CO")
    user.favorites.create(location: "Chicago, IL")

    params = {"api_key" => "12345"}

    get '/api/v1/favorites', :params => params

    expect(response.status).to eq 401
  end

end
