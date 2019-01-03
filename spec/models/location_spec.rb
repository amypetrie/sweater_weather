require "rails_helper"

describe Location, type: :model do
  it "exists" do

  place = {"location" => "denver,co"}
  location = Location.new(place)

  expect(location).to be_a Location

  end
end
