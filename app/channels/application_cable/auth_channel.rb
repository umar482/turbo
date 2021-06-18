class AuthChannel < ApplicationCable::Channel
  def self.for_token(token:)
    "AuthChannel_#{token}"
  end

  def subscribed
    stream_from AuthChannel.for_token(
                  token: token_param
                )
  end

  private

  def token_param
    params[:room]
  end
end
