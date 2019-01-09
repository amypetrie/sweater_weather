require "rails_helper"

describe "Giphy API Service" do
  it "returns a random gif" do
    VCR.use_cassette("giphy_random_api_results") do

      filter = {weather: "weather"}
      service = GiphyService.new(filter)

      results = service.get_random_gif

      expect(results).to be_a Hash
      expect(results).to have_key :data
      expect(results[:data]).to have_key :images
      expect(results[:data][:images]).to have_key :fixed_height_still
      expect(results[:data][:images][:fixed_height_still]).to have_key :url
    end
  end

  it "returns a weather gif" do
    VCR.use_cassette("giphy_queried_api_results") do

      filter = {weather: "weather"}
      service = GiphyService.new(filter)

      results = service.get_weather_gif

      expect(results).to be_a Hash
      expect(results).to have_key :data
      expect(results[:data].first).to have_key :images
      expect(results[:data].first[:images]).to have_key :fixed_height_still
      expect(results[:data].first[:images][:fixed_height_still]).to have_key :url
    end
  end



end
