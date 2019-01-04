class Api::V1::UsersController < ApplicationController

  def new

  end

  def create
    user = User.new(user_params)
    user.save
    render json: {api_key: user.api_key}, status: 201
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end
