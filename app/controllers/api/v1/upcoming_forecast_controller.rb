class Api::V1::UpcomingForecastController < ActionController::API

  def index
   wrapper = LocationForecastWrapper.new(new_location: location_params)
    location_forecast =wrapper.create_location_forecast
    upcoming_daily_forecasts = UpcomingForecastSerializer.new(location_forecast.upcoming_forecast)
   wrapper = UpcomingWeatherWrapper.new(upcoming_forecast: upcoming_daily_forecasts)

    render status: 201, json:wrapper.to_json
  end

  private
    def location_params
      params.require(:location)
    end

end
