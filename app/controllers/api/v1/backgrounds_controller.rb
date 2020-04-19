class Api::V1::BackgroundsController < ApplicationController
  def show
    background = BackgroundSearch.new(params[:location])
    
    render json: BackgroundSerializer.new(background.get_background)
  end
end
