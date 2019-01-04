class UpcomingWeatherWrapper
  attr_reader :copyright,
              :upcoming_weather_days,
              :id

  def initialize(data)
    @id = Time.now.to_i
    @copyright = Time.now.strftime('%Y')
    @upcoming_weather = data[:upcoming_weather]
  end
end
