require "rails_helper"

describe "Giphy API Service" do
  it "returns a random gif" do
    VCR.use_cassette("giphy_api_results") do

    filter = {coordinates: coordinates}
    service = DarkSkyService.new(filter)

    results = service.get_weather_forcast
    expect(results).to be_a Hash
    end
  end
end
