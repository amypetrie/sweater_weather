require "rails_helper"

describe Location, type: :model do

  before(:each) do
    stub_request(:get, /api.darksky.net/).
      to_return(body: File.read("./spec/fixtures/dark_sky_results.json"))

    place = {:location => "denver,co", :coordinates => [  39.7400093078613,-104.99201965332], :id => "6182059163d844b685219c7657b44a30|CO320968BC|7.7.0.0|Ref A: 9850A83D575D42FAB389B855B41C39F0 Ref B: CO1EDGE0107 Ref C: 2019-01-03T19:06:45Z"}

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

    it ".daily_forecast" do
      expect(@location.daily_forecast).to be_a DailyForecast
      expect(@location.daily_forecast.current_temp).to eq 49.81
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
