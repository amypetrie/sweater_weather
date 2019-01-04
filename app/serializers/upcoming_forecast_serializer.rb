class UpcomingForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :time, :summary
end
