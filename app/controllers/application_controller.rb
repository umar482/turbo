class ApplicationController < ActionController::Base

   before_action :authenticate_user!

  def authenticate_user!
    authenticate_app_user if app?
    super
  end

  def authenticate_app_user
    user = User.find_by(email: cookies[:authentication])
    cookies[:authentication] = user.email if user
    sign_in(user) if user
  end

  def app?
    request.user_agent.include?('Turbo Native iOS')
  end

end
