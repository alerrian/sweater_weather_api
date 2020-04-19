class Api::V1::ForecastController < ApplicationController
  def show
    weather = ForecastSearch.new(params[:location])

    render json: ForecastSerializer.new(weather.get_forecast)
  end
end
