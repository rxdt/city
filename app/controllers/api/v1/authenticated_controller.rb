class Api::V1::AuthenticatedController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, fallback_to_devise: false


end
