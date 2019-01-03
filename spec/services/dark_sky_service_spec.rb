require "rails_helper"

describe "Dark Sky API Service" do
  it "returns forcast for a set of coordinates" do
    VCR.use_cassette("dark_sky_api_results") do

    coordinates = [39.7400093078613,-104.99201965332]

    filter = {coordinates: coordinates}
    service = DarkSkyService.new(filter)

    results = service.get_weather_forcast
    expect(results).to be_a Hash
    expect(results).to have_key :currently
    expect(results).to have_key :hourly
    expect(results).to have_key :daily
    end
  end
end
