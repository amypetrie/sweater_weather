class BingMapService

  def initialize(filter)
    @filter = filter
  end

  def get_location_result
    get_json("Locations?query=#{location}")
  end

  def location
    filter[:location].gsub(/([, ])/, '%20')
  end

  private
  attr_reader :filter

    def conn
      Faraday.new(url: "http://dev.virtualearth.net/REST/v1/") do |f|
        f.params['key'] = ENV['BING_MAP_API_KEY']
        f.adapter Faraday.default_adapter
      end
    end

    def get_json(uri)
      response = conn.get(uri)
      JSON.parse(response.body, symbolize_names: true)
    end

end
