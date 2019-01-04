class UpcomingForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :time, :summary
  attribute :url do |obj|
    obj.weather_gif
  end
end
