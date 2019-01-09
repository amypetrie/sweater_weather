require "rails_helper"

describe "/api/v1/gifs?location=denver,co" do

  it "returns links to animated GIFs based on the weather for each upcoming day" do

    stub_request(:get, /dev.virtualearth.net/).
      to_return(body: File.read("./spec/fixtures/bing_map_results.json"))

    stub_request(:get, /api.darksky.net/).
      to_return(body: File.read("./spec/fixtures/dark_sky_results.json"))


    get '/api/v1/gifs?location=denver,co'

    response_back = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(201)

    expect(response_back).to have_key :daily_forecasts
    expect(response_back).to have_key :copyright
    expect(response_back[:daily_forecasts][:data].first).to have_key :attributes
    expect(response_back[:daily_forecasts][:data].first[:attributes]).to have_key :summary
    expect(response_back[:daily_forecasts][:data].first[:attributes][:summary]).to eq "Clear throughout the day."
    expect(response_back[:daily_forecasts][:data].first[:attributes]).to have_key :url
    expect(response_back[:daily_forecasts][:data].first[:attributes][:url]).to be_a String
  end
end
