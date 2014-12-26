require File.expand_path('../production', __FILE__)

Rails.application.configure do
  config.log_level = :debug

  #config.paperclip_defaults[:s3_credentials][:bucket] = 'cityxcape-staging'
  config.action_mailer.default_url_options = { host: "cityxcape.herokuapp.com" }
end
