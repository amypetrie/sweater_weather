class Location
  attr_reader :location_id

  def initialize(data)
    @location_id = data["location"]
    @_daily_weather = daily_weather
    @_upcoming_weather = upcoming_weather
    @_hourly_weather = hourly_weather
    @_bing_location_result = bing_location_result
    @_dark_sky_result = dark_sky_result
  end

  def bing_location_result
    @_bing_result ||= bing_service.get_location_result
  end

  def daily_weather
  end

  def upcoming_weather
  end

  def hourly_weather
  end

  def dark_sky_result
  end

  private

    def bing_service
      filter = {location: location_id}
      BingMapService.new(filter)
    end

    def dark_sky_service

    end
end
