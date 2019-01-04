class UpcomingForecast
  attr_reader :summary,
              :humidity,
              :temperature_high,
              :temperature_low,
              :time

  def initialize(data)
    @summary = data[:summary]
    @humidity = data[:humidity]
    @temperature_high = data[:temperatureHigh]
    @temperature_low = data[:temperatureLow]
    @time = data[:time]
  end

end
