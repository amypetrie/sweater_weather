require "rails_helper"

describe Location, type: :model do

  before(:each) do
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
  end
end
