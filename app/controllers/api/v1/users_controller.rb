class Api::V1::UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      render json: UsersSerializer.new(@user)
    else
      render status: 400
    end
  end

  private

  def user_params
    params.require(:users).permit(:email, :password, :password_confirmation)
  end
end
