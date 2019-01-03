require "rails_helper"

describe "Bing Map API Service" do
  it "returns coordinates for a queried text location" do
    VCR.use_cassette("bing_map_location_request") do
      filter = {location: "denver,co"}
      service = BingMapService.new(filter)

      results = service.get_location_result

      expect(results).to be_a Hash
      expect(results).to have_key :resourceSets
      expect(results[:resourceSets].first).to have_key :resources
      expect(results[:resourceSets].first[:resources].first).to have_key :name
      expect(results[:resourceSets].first[:resources].first).to have_key :point
      expect(results[:resourceSets].first[:resources].first[:point]).to have_key :coordinates
      expect(results[:resourceSets].first[:resources].first[:point][:coordinates]).to be_an Array
      expect(results[:resourceSets].first[:resources].first[:point][:coordinates].length).to eq 2
    end
  end
end
