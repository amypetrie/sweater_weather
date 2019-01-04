class DarkSkyService
  attr_reader :coordinates

  def initialize(data)
    @coordinates = data[:coordinates]
  end

  def latitude
    coordinates.first
  end

  def longitude
    coordinates.last
  end

  def get_weather_forcast
    id = ENV['DARK_SKY_API_KEY']

    get_json("/forecast/#{id}/#{latitude},#{longitude}")
  end

  private

    def conn
      Faraday.new(url: "https://api.darksky.net") do |f|
        f.adapter Faraday.default_adapter
      end
    end

    def get_json(uri)
      results = conn.get(uri)
      JSON.parse(results.body, symbolize_names: true)
    end

end
