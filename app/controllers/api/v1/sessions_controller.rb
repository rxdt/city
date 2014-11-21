class Api::V1::SessionsController < Api::V1::BaseController

  def create
    @user = User.authenticate params[:email], params[:password]
    raise Exceptions::AuthenticationUnknown unless @user
    respond_with @user, location: api_v1_sessions_url
  end

end
