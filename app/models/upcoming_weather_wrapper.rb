class UpcomingWeatherWrapper
  attr_reader :copyright,
              :daily_forecasts

  def initialize(data)
    @copyright = Time.now.strftime('%Y')
    @daily_forecasts = data[:upcoming_weather]
  end
end
