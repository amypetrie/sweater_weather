require "rails_helper"

describe LocationForecast, type: :model do

  before(:each) do
    stub_request(:get, /api.darksky.net/).
      to_return(body: File.read("./spec/fixtures/dark_sky_results.json"))

    place = {:location => "denver,co", :coordinates => [  39.7400093078613,-104.99201965332], :id => "6182059163d844b685219c7657b44a30|CO320968BC|7.7.0.0|Ref A: 9850A83D575D42FAB389B855B41C39F0 Ref B: CO1EDGE0107 Ref C: 2019-01-03T19:06:45Z"}

    @location_forecast = LocationForecast.new(place)
  end

  it "exists" do
    expect(@location_forecast).to be_a LocationForecast
  end

  describe "instance_methods" do
    it ".coordinates" do
      expect(@location_forecast.coordinates).to be_an Array
      expect(@location_forecast.coordinates).to eq [
                            39.7400093078613,
                            -104.99201965332
                        ]
    end

    it ".daily_forecast" do
      expect(@location_forecast.daily_forecast).to be_a DailyForecast
      expect(@location_forecast.daily_forecast.current_temp).to eq 49.81
    end

    it ".hourly_forecast" do
      expect(@location_forecast.hourly_forecast).to be_an Array
      expect(@location_forecast.hourly_forecast.first).to be_a HourlyForecast
      expect(@location_forecast.hourly_forecast.first.temperature).to eq 49.61
    end

    it ".upcoming_forecast" do
      expect(@location_forecast.upcoming_forecast).to be_an Array
      expect(@location_forecast.upcoming_forecast.first).to be_an UpcomingForecast
      expect(@location_forecast.upcoming_forecast.first.temperature_high).to eq 50.48
    end
  end
end
