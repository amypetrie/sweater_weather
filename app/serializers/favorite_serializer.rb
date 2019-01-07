class FavoriteSerializer
  include FastJsonapi::ObjectSerializer

  attribute :location do |obj|
    obj.daily_forecast
  end

  attribute :current_weather do |obj|
    obj.daily_weather
  end

end
