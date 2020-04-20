class Api::V1::RoadTripController < ApplicationController
  before_action :authenticate

  def create
    weather_info = ForecastSearch.new(params[:destination])

    trip_time = TripSearch.new(params[:origin], params[:destination])
    
    render json: TripSerializer.new(Trip.new(trip_time, weather_info, params[:origin], params[:destination]))
  end

  private

  def authenticate
    user = User.find_by(api_key: params[:api_key])

    if user
      @current_user = user
    else
      render status: 401
    end
  end
end
