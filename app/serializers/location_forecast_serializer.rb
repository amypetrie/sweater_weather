class LocationForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :location_description
  attribute :daily_forecast do |obj|
    obj.daily_forecast
  end
  attribute :hourly_forecast do |obj|
    obj.hourly_forecast
  end
  attribute :upcoming_forecast do |obj|
    obj.upcoming_forecast
  end
  attribute :time do |obj|
    Time.now
  end
end
