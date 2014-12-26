require 'exceptions'

class Api::V1::BaseController < ActionController::Base
  protect_from_forgery with: :null_session
  respond_to :json

  rescue_from StandardError, with: :internal
  rescue_from CanCan::AccessDenied, with: :access_denied
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::StatementInvalid, with: :invalid
  rescue_from Apipie::ParamMissing, with: :missing_params
  rescue_from Exceptions::AuthenticationUnknown, with: :access_denied

  private

  def access_denied
    render json: { error: 'access denied' }, status: :unauthorized
  end

  def not_found
    render json: { error: 'record not found' }, status: :not_found
  end

  def invalid
    render json: { error: 'statement invalid' }, status: :bad_request
  end

  def missing_params e
    render json: { error: e.message }, status: :bad_request
  end

  def internal
    render json: { error: 'internal error' }, status: :internal_server_error
  end

end
