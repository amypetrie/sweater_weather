class UpcomingWeatherWrapper
  attr_reader :copyright,
              :daily_forecasts,
              :id

  def initialize(data)
    @id = Time.now.to_i
    @copyright = Time.now.strftime('%Y')
    @daily_forecasts = data[:upcoming_weather]
  end
end
