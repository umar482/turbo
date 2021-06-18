class AuthController < ApplicationController
  skip_before_action :authenticate_user!

  def token
    cookies[:channel_room] = SecureRandom.uuid
    render json: {token: cookies[:channel_room] }, status: :ok
  end
end
