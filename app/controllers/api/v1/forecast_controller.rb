class Api::V1::ForecastController < ApplicationController
  def show
    location = params[:location]
    location_data = Location.new(location)
    forecast_data = Forecast.new
    
    render json: forecast_data.by_location(location_data)
  end
end
