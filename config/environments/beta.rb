require File.expand_path('../production', __FILE__)

Rails.application.configure do
  # Additional environment customizations go here
  config.action_mailer.default_url_options = { host: "beta.cityxcape.com" }
end
