require "rails_helper"

describe DailyForecast, type: :model do

  before(:each) do
    stub_request(:get, /api.darksky.net/).
      to_return(body: File.read("./spec/fixtures/dark_sky_results.json"))

    place = place = {:location => "denver,co", :coordinates => [  39.7400093078613,-104.99201965332], :id => "6182059163d844b685219c7657b44a30|CO320968BC|7.7.0.0|Ref A: 9850A83D575D42FAB389B855B41C39F0 Ref B: CO1EDGE0107 Ref C: 2019-01-03T19:06:45Z"}
    @location = Location.new(place)
  end

  it "exists" do
    expect(@location.daily_weather).to be_a DailyForecast
  end

  it "has attributes" do

    expect(@location.daily_weather.daily_summary).to eq "Clear throughout the day."
    expect(@location.daily_weather.current_summary).to eq "Clear"
    expect(@location.daily_weather.current_temp).to eq 49.81
    expect(@location.daily_weather.feels_like_temp).to eq 49.81
    expect(@location.daily_weather.current_time).to eq 1546542833
    expect(@location.daily_weather.humidity).to eq 0.3
    expect(@location.daily_weather.visibility).to eq 10
    expect(@location.daily_weather.uv_index).to eq 2
    expect(@location.daily_weather.temperature_high).to eq 50.48
    expect(@location.daily_weather.temperature_low).to eq 28.58
  end
end
