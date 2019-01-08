class Api::V1::LocationForecastController < ActionController::API

  def index
    facade = LocationForecastFacade.new(new_location: location_params)
    location_forecast = facade.create_location_forecast

    render json: LocationForecastSerializer.new(location_forecast)
  end

  private
    def location_params
      params.require(:location)
    end

end
