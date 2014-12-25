class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    access_denied(exception)
  end

  def access_denied(e)
    redirect_to root_path, :alert => e.message
  end
end
