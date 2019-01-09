class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user_has_secure_password && user.save
      render status: 201, json: {api_key: user.api_key}
    else
      render status: 401
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end
