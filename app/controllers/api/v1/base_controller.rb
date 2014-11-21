require 'exceptions'

class Api::V1::BaseController < ActionController::Base
  respond_to :json

  rescue_from StandardError, with: :internal
  rescue_from CanCan::AccessDenied, with: :access_denied
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::StatementInvalid, with: :invalid
  rescue_from Exceptions::BadParameters, with: :invalid
  rescue_from Exceptions::AuthenticationUnknown, with: :access_denied

  private

  def access_denied
    render json: { status: 401, error: 'access denied' }, status: :unauthorized
  end

  def not_found
    render json: { status: 404, error: 'record not found' }, status: :not_found
  end

  def invalid
    render json: { status: 400, error: 'statement invalid' }, status: :bad_request
  end

  def internal
    render json: { status: 500, error: 'internal error' }, status: :internal_server_error
  end

end
