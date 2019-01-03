require "rails_helper"

describe Location, type: :model do

  before(:each) do
    stub_request(:get, /api.darksky.net/).
      to_return(body: File.read("./spec/fixtures/dark_sky_results.json"))

    place = {"location" => "denver,co"}
    @location = Location.new(place)
  end

  it "exists" do
    expect(@location).to be_a Location
  end

  describe "instance_methods" do
    it ".coordinates" do
      expect(@location.coordinates).to be_an Array
      expect(@location.coordinates).to eq [
                            39.7400093078613,
                            -104.99201965332
                        ]
    end

    it ".daily_weather" do
      expect(@location.daily_weather).to be_a DailyForecast
      expect(@location.daily_weather.current_temp).to eq 49.81
    end

    it ".hourly_weather" do
      expect(@location.hourly_weather).to be_an Array
      expect(@location.hourly_weather.first).to be_a HourlyForecast
      expect(@location.hourly_weather.first.temperature).to eq 49.61
    end

    it ".upcoming_weather" do
      expect(@location.upcoming_weather).to be_an Array
      expect(@location.upcoming_weather.first).to be_an UpcomingForecast
      expect(@location.upcoming_weather.first.temperature_high).to eq 50.48
    end
  end
end
