class Api::V1::AntipodeController < ApplicationController
  def show
    location = Location.new(params[:location])

    render json: AntipodeSerializer.new(AntipodeSearch.new(location.lat, location.long))
  end
end
