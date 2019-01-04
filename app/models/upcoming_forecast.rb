class UpcomingForecast
  attr_reader :summary,
              :humidity,
              :temperature_high,
              :temperature_low,
              :time,
              :id

  def initialize(data)
    @id = Time.now.to_i
    @summary = data[:summary]
    @humidity = data[:humidity]
    @temperature_high = data[:temperatureHigh]
    @temperature_low = data[:temperatureLow]
    @time = data[:time]
  end

  def weather_gif
    giphy_results[:data][:images][:fixed_height_still][:url]
  end

  private
    def service
      filter = {weather: @summary}
      GiphyService.new(filter)
    end

    def giphy_results
      @results ||= service.get_weather_gif
    end

end
