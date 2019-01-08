class LocationForecast
  attr_reader :id,
              :location_description,
              :coordinates

  def initialize(data)
    @id = data[:id]
    @location_description = data[:location]
    @coordinates = data[:coordinates]
    @_daily_forecast = nil
    @_upcoming_weather = []
    @_hourly_weather = []
  end

  def load_all_weather
    daily_forecast
    hourly_weather
    upcoming_weather
  end

  def daily_forecast
    current_details = dark_sky_results[:currently]
    day_details = dark_sky_results[:daily][:data].first

    @_daily_forecast = DailyForecast.new(current_details, day_details)
  end

  def hourly_weather
    dark_sky_results[:hourly][:data].each do |hour|
      new_hour = HourlyForecast.new(hour)
      @_hourly_weather << new_hour
    end
    @_hourly_weather
  end

  def upcoming_weather
    dark_sky_results[:daily][:data].each do |day|
      new_upcoming_day = UpcomingForecast.new(day)
      @_upcoming_weather << new_upcoming_day
    end
    @_upcoming_weather
  end

  private

    def dark_sky_service
      DarkSkyService.new({coordinates: self.coordinates})
    end

    def dark_sky_results
      @dark_sky_results ||= dark_sky_service.get_weather_forcast
    end
end
