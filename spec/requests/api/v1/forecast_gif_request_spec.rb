require "rails_helper"

describe "/api/v1/gifs?location=denver,co" do

  it "returns links to animated GIFs based on the weather for each day for the next 8 days" do

    stub_request(:get, /dev.virtualearth.net/).
      to_return(body: File.read("./spec/fixtures/bing_map_results.json"))

    stub_request(:get, /api.darksky.net/).
      to_return(body: File.read("./spec/fixtures/dark_sky_results.json"))

    stub_request(:get, /api.giphy.com/).
      to_return(body: File.read("./spec/fixtures/random_giphy_result.json"))

    get '/api/v1/gifs?location=denver,co'

    response_back = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
binding.pry
    expect(response_back).to have_key :data
    expect(response_back).to have_key :copyright
    expect(response_back[:data].first).to have_key :attributes
    expect(response_back[:data].first[:attributes]).to have_key :summary
    expect(response_back[:data].first[:attributes][:summary]).to eq "Clear throughout the day."
    expect(response_back[:data].first[:attributes]).to have_key :url
    expect(response_back[:data].first[:attributes][:url]).to eq "https://media2.giphy.com/media/xUNd9W0kPQknKh6V56/200_s.gif"
  end
end
