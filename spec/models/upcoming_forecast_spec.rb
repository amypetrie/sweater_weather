require "rails_helper"
describe UpcomingForecast, type: :model do

  before(:each) do
    stub_request(:get, /api.darksky.net/).
      to_return(body: File.read("./spec/fixtures/dark_sky_results.json"))

    stub_request(:get, /api.giphy.com/).
      to_return(body: File.read("./spec/fixtures/random_giphy_result.json"))

    place = {:location => "denver,co", :coordinates => [  39.7400093078613,-104.99201965332], :id => "6182059163d844b685219c7657b44a30|CO320968BC|7.7.0.0|Ref A: 9850A83D575D42FAB389B855B41C39F0 Ref B: CO1EDGE0107 Ref C: 2019-01-03T19:06:45Z"}
    @location_forecast = LocationForecast.new(place)
    @forecast = @location_forecast.upcoming_forecast.first
  end

  it "exists" do
    expect(@forecast).to be_an UpcomingForecast
  end

  describe "instance methods" do
    it "returns a giphy url" do
      expect(@forecast.weather_gif).to be_a String
      expect(@forecast.weather_gif).to eq "https://media2.giphy.com/media/xUNd9W0kPQknKh6V56/200_s.gif"
    end
  end
end
