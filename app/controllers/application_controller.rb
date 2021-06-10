class ApplicationController < ActionController::Base

 skip_before_action :verify_authenticity_token
  before_action :authenticate_user!

  def authenticate_user!
    if user_signed_in?
      cookies[:authentication] = current_user.email
    end
    authenticate_app_user if app?
    super
  end

  def authenticate_app_user
    pp cookies[:authentication]
    user = User.find_by(email: cookies[:authentication])
    pp user
    sign_in(user)
  end

  def app?
    request.user_agent.include?('Turbo Native iOS')
  end
end
