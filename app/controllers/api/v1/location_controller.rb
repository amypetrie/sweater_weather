class Api::V1::LocationController < ApplicationController

  def new
    location = Location.new(location_params)
    # weather = location.current_weather

    # render json: LocationSerializer.new(location)
  end

  private
    def location_params
      params.require("location")
    end

end
