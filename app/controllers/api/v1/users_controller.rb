class Api::V1::UsersController < ActionController::API

  def create
    user = User.new(user_params)
    render status: 201, json: {api_key: user.api_key} if user.save
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

end
