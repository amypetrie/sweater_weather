class FavoriteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location

  attribute :weather_data do |obj|
   wrapper = LocationForecastWrapper.new(new_location: obj.location)
    location =wrapper.create_location_forecast
    LocationForecastSerializer.new(location)
  end

end
