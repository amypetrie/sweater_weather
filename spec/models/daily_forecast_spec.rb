require "rails_helper"

describe DailyForecast, type: :model do

  before(:each) do
    stub_request(:get, /api.darksky.net/).
      to_return(body: File.read("./spec/fixtures/dark_sky_results.json"))

    place = place = {:location => "denver,co", :coordinates => [  39.7400093078613,-104.99201965332], :id => "6182059163d844b685219c7657b44a30|CO320968BC|7.7.0.0|Ref A: 9850A83D575D42FAB389B855B41C39F0 Ref B: CO1EDGE0107 Ref C: 2019-01-03T19:06:45Z"}
    @location = Location.new(place)
  end

  it "exists" do
    expect(@location.daily_forecast).to be_a DailyForecast
  end

  it "has attributes" do

    expect(@location.daily_forecast.daily_summary).to eq "Clear throughout the day."
    expect(@location.daily_forecast.current_summary).to eq "Clear"
    expect(@location.daily_forecast.current_temp).to eq 49.81
    expect(@location.daily_forecast.feels_like_temp).to eq 49.81
    expect(@location.daily_forecast.current_time).to eq 1546542833
    expect(@location.daily_forecast.humidity).to eq 0.3
    expect(@location.daily_forecast.visibility).to eq 10
    expect(@location.daily_forecast.uv_index).to eq 2
    expect(@location.daily_forecast.temperature_high).to eq 50.48
    expect(@location.daily_forecast.temperature_low).to eq 28.58
  end

end
