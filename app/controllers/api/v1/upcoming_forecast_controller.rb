class Api::V1::UpcomingForecastController < ActionController::API

  def index
    facade = LocationFacade.new(new_location: location_params)
    location = facade.create_location
    upcoming_daily_forecasts = location.upcoming_weather

    render json: UpcomingForecastSerializer.new(upcoming_daily_forecasts)
  end

  private
    def location_params
      params.require("location")
    end

end
