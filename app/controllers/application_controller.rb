class ApplicationController < ActionController::Base
  def default_action
    redirect_to resolve_root_url
  end

  def resolve_root_url
    if user_signed_in?
      posts_path
    else
      new_user_session_path
    end
  end
end
