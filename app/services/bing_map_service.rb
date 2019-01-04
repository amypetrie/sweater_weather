class BingMapService
  attr_reader :filter

  def initialize(filter)
    @filter = filter
  end

  def get_location_result
    get_json("/REST/v1/Locations?query=#{location}")
  end

  def location
    filter[:requested_location].gsub(/([, ])/, '%20')
  end

  private

    def conn
      Faraday.new(url: "http://dev.virtualearth.net") do |f|
        f.params['key'] = ENV['BING_MAP_API_KEY']
        f.adapter Faraday.default_adapter
      end

    end

    def get_json(uri)
      response = conn.get(uri)
      JSON.parse(response.body, symbolize_names: true)
    end

end
