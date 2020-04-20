class Api::V1::AntipodeController < ApplicationController
  def show
    location = Location.new(params[:location])

    antipode = Antipode.new(location.lat, location.long)
  end
end
