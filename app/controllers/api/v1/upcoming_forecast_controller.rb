class Api::V1::UpcomingForecastController < ActionController::API

  def index
    facade = LocationFacade.new(new_location: location_params)
    location = facade.create_location
    upcoming_daily_forecasts = location.upcoming_weather
    wrapper = UpcomingWeatherWrapper.new(upcoming_weather: upcoming_daily_forecasts)

    render json: UpcomingWeatherWrapperSerializer.new(wrapper)
  end

  private
    def location_params
      params.require("location")
    end

end
