class UpcomingWeatherWrapperSerializer
  include FastJsonapi::ObjectSerializer
  attributes :copyright, :upcoming_weather_days
end
