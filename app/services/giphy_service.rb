class GiphyService

  def initialize(filter)
    @filter = filter
  end

  def get_random_gif
    get_json("/v1/gifs/random")
  end

  def get_weather_gif
    input = parse_string_for_request(@filter[:weather])
    get_json("/v1/gifs/search?&q=#{input}")
  end

  def parse_string_for_request(string)
    string.gsub(/([ ])/, '+')
  end

private
  def conn
    Faraday.new(url: "http://api.giphy.com") do |f|
      f.params['api_key'] = ENV['GIPHY_API_KEY']
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(uri)
    results = conn.get(uri)
    JSON.parse(results.body, symbolize_names: true)
  end
end
