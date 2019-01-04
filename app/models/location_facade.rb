class LocationFacade
  attr_reader :new_location

  def initialize(data)
    @new_location = data[:new_location]
  end

  def create_location
    location_data = {coordinates: find_coordinates, location_description: @new_location, id: id_for_location}
    location = Location.new(location_data)
    location.load_all_weather
    location
  end

  def find_coordinates
    bing_results[:resourceSets].first[:resources].first[:point][:coordinates]
  end

  def id_for_location
    id = bing_results[:traceId].reverse[0..19]
  end

private

    def bing_service
      BingMapService.new({requested_location: @new_location})
    end

    def bing_results
      @bing_results ||= bing_service.get_location_result
    end

end
