class Api::V1::LocationController < ActionController::API

  def index
    facade = LocationFacade.new(new_location: location_params)
    location = facade.create_location

    render json: LocationSerializer.new(location)
  end

  private
    def location_params
      params.require(:location)
    end

end
