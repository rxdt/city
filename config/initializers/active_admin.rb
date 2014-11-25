ActiveAdmin.setup do |config|

  config.site_title = "Vivify"

  config.site_title_link = "/"
  # config.site_title_image = "logo.png"
  # config.favicon = '/assets/favicon.ico'

  config.authentication_method = :authenticate_user!
  config.authorization_adapter = ActiveAdmin::CanCanAdapter
  config.on_unauthorized_access = :access_denied
  config.current_user_method = :current_user
  config.logout_link_path = :destroy_user_session_path
  config.logout_link_method = :delete

  config.batch_actions = true

end
