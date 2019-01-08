class Api::V1::LocationForecastController < ActionController::API

  def index
   wrapper = LocationForecastWrapper.new(new_location: location_params)
    location_forecast =wrapper.create_location_forecast

    render json: LocationForecastSerializer.new(location_forecast)
  end

  private
    def location_params
      params.require(:location)
    end

end
