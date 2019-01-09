class ApplicationController < ActionController::API

  def user_has_secure_password
    true if params[:password] == params[:password_confirmation]
  end

end
