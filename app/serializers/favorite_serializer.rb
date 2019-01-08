class FavoriteSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location

  attribute :weather_data do |obj|
    facade = LocationForecastFacade.new(new_location: obj.location)
    location = facade.create_location_forecast
    LocationForecastSerializer.new(location)
  end

end
