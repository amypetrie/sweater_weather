class Location
  attr_reader :location_id

  def initialize(data)
    @location_id = data["location"]
    @_daily_weather = daily_weather
    @_upcoming_weather = []
    @_hourly_weather = []
    @_bing_location_result = bing_location_result
    @_dark_sky_result = dark_sky_result
  end

  def bing_location_result
    @_bing_result ||= bing_service.get_location_result
  end

  def dark_sky_result
    @_dark_sky_result ||= dark_sky_service.get_weather_forcast
  end

  def daily_weather
    current_details = dark_sky_result[:currently]
    day_details = dark_sky_result[:daily][:data].first

    @_daily_weather = DailyForecast.new(current_details, day_details)
  end

  def hourly_weather
    dark_sky_result[:hourly][:data].each do |hour|
      new_hour = HourlyForecast.new(hour)
      @_hourly_weather << new_hour
    end
    @_hourly_weather
  end

  def upcoming_weather
    dark_sky_result[:daily][:data]first(8).each do |day|
      new_upcoming_day = UpcomingForecast.new(day)
      @_upcoming_weather << new_upcoming_day
    end
    @_upcoming_day
  end

  def coordinates
    bing_location_result[:resourceSets].first[:resources].first[:point][:coordinates]
  end

  private

    def bing_service
      filter = {location: location_id}
      BingMapService.new(filter)
    end

    def dark_sky_service
      filter = {coordinates: coordinates}
      DarkSkyService.new(filter)
    end
end
