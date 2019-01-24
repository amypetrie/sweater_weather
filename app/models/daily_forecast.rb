class DailyForecast
  attr_reader :daily_summary,
              :current_summary,
              :current_temp,
              :feels_like_temp,
              :current_time,
              :humidity,
              :visibility,
              :uv_index,
              :temperature_high,
              :temperature_low,
              :time

  def initialize(current_details, day_details)
    @daily_summary = day_details[:summary]
    @current_summary = current_details[:summary]
    @current_temp = current_details[:temperature]
    @feels_like_temp = current_details[:apparentTemperature]
    @current_time = current_details[:time]
    @humidity = current_details[:humidity]
    @visibility = current_details[:visibility]
    @uv_index= current_details[:uvIndex]
    @temperature_high = day_details[:temperatureHigh]
    @temperature_low = day_details[:temperatureLow]
    @time = day_details[:time]
  end

end
