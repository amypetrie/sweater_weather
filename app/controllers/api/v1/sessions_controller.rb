class Api::V1::SessionsController < ActionController::API

  def new
  end

  def create
    user = User.find_by(email: session_params["email"])
    render status: 200, json: {api_key: user.api_key} if user && user.authenticate(session_params["password"])
  end

  private
    def session_params
      params.permit(:email, :password)
    end
end
