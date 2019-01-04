class LocationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id
  attribute :daily_weather do |obj|
    obj.daily_weather
  end
  attribute :hourly_weather do |obj|
    obj.hourly_weather
  end
  attribute :upcoming_weather do |obj|
    obj.upcoming_weather
  end
end
