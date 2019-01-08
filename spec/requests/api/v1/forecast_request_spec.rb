require "rails_helper"

describe "GET /api/v1/forecast?location=denver,co" do

  it "returns forcast data" do

    stub_request(:get, /localhost/).
      to_return(body: File.read("./spec/fixtures/dark_sky_results.json"))

    get '/api/v1/forecast?location=denver,co'

    response_back = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(response_back).to have_key :data
    expect(response_back[:data]).to have_key :attributes
    expect(response_back[:data][:attributes]).to have_key :daily_forecast
    expect(response_back[:data][:attributes]).to have_key :hourly_forecast
    expect(response_back[:data][:attributes]).to have_key :upcoming_forecast
  end

end
