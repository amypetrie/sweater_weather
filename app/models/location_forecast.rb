class LocationForecast
  attr_reader :id,
              :location_description,
              :coordinates

  def initialize(data)
    @id = data[:id]
    @location_description = data[:location]
    @coordinates = data[:coordinates]
    @_current_time = nil
    @_daily_forecast = nil
    @_upcoming_forecast = []
    @_hourly_forecast = []
    @_timezone = nil
  end

  def load_all_weather
    daily_forecast
    hourly_forecast
    upcoming_forecast
  end

  def timezone
    timezone = dark_sky_results[:timezone]

    @_timezone = timezone
  end

  def current_time
    curr_time = dark_sky_results[:currently][:time]

    @_current_time = curr_time
  end

  def daily_forecast
    current_details = dark_sky_results[:currently]
    day_details = dark_sky_results[:daily][:data].first

    @_daily_forecast = DailyForecast.new(current_details, day_details)
  end

  def hourly_forecast
    dark_sky_results[:hourly][:data].each do |hour|
      new_hour = HourlyForecast.new(hour)
      @_hourly_forecast << new_hour
    end
    @_hourly_forecast
  end

  def upcoming_forecast
    dark_sky_results[:daily][:data].each do |day|
      new_upcoming_day = UpcomingForecast.new(day)
      @_upcoming_forecast << new_upcoming_day
    end
    @_upcoming_forecast
  end

  private

    def dark_sky_service
      DarkSkyService.new({coordinates: self.coordinates})
    end

    def dark_sky_results
      @dark_sky_results ||= dark_sky_service.get_weather_forcast
    end
end
