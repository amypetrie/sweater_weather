require "rails_helper"

describe "/api/v1/gifs?location=denver,co" do

  it "returns links to animated GIFs based on the weather for each day for the next 8 days" do

    # stub_request(:get, /localhost/).
    #   to_return(body: File.read("./spec/fixtures/dark_sky_results.json"))

    get '/api/v1/gifs?location=denver,co'

    response_back = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(response_back).to have_key :data
    expect(response_back[:data]).to have_key :daily_forcasts
    expect(response_back[:data][:daily_forcasts].first).to have_key :url
  end
end
