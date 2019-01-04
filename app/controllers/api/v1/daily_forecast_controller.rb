class Api::V1::DailyForecastController < ActionController::API

  def index
    facade = LocationFacade.new(new_location: location_params)
    location = facade.create_location

    render json: 
  end

  private
    def location_params
      params.require("location")
    end

end
