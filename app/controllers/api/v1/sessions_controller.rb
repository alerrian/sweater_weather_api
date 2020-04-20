class Api::V1::SessionsController < ApplicationController
  def create
    @user = User.find_by(email: params[:users][:email])
                .try(:authenticate, params[:users][:password])

    if @user
      session[:id] = @user.id
      render json: { status: 200, body: UsersSerializer.new(@user) }
    else
      render status: 401
    end
  end
end
