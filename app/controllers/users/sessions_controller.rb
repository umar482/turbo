class Users::SessionsController < Devise::SessionsController


  def method_name
      ActionCable.server.broadcast "DataShareChannel_#{params[:lead][:uu_id]}", {lead: params[:lead].as_json}
  end

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    ActionCable.server.broadcast "AuthChannel_#{cookies[:channel_room]}", {authentication: User.last.email}.as_json
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    set_flash_message! :notice, :signed_out if signed_out
    cookies.delete :authentication if signed_out
    ActionCable.server.broadcast "AuthChannel_#{cookies[:channel_room]}", {session_out: true}.as_json if signed_out
    yield if block_given?
    respond_to_on_destroy
  end
end
