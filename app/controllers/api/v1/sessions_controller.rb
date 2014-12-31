class Api::V1::SessionsController < Api::V1::BaseController

  api :POST, '/sessions'
  formats [ 'json' ]
  param :email, String, required: true, desc: 'The email address of the user to authenticate'
  param :password, String, required: true, desc: 'The password for the user'
  error 401, 'The email address, password, or both were not found or invalid'
  description <<-EOS
    Authenticate an API user
    ------------------------

    This endpoint provides a means for an API consumer to obtain the user's API token for authenticating
    with the rest of the API.

    Successful authentication returns the specified user object, including the authentication token.
  EOS
  example <<-EOS
    'user': { email: 'user@email.com', 'authentication_token': 'esvCFFEQay-5My9DFFgZ', ... }
  EOS
  def create
    @user = User.authenticate params[:email], params[:password]
    raise Exceptions::AuthenticationUnknown unless @user
    respond_with @user, location: api_v1_sessions_url, status: :created, status: :created
  end
end
