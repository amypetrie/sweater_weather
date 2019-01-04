class HourlyForecast
  attr_reader :temperature,
              :summary,
              :time

  def initialize(data)
    @temperature = data[:temperature]
    @summary = data[:summary]
    @time = data[:time]
  end

end
