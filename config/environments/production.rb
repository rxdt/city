Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.serve_static_assets = true
  config.assets.js_compressor = :uglifier
  config.assets.compile = false
  config.assets.digest = true
  config.log_level = :info
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new
  config.active_record.dump_schema_after_migration = false

  #fail 'Need to set AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY in environment.' if ENV['AWS_ACCESS_KEY_ID'].blank? || ENV['AWS_SECRET_ACCESS_KEY'].blank?
  #config.paperclip_defaults = { storage: :s3,
  #                             s3_credentials: { bucket: 'cityxcape-production' } }

  fail 'Need to set POSTMARK_KEY in environment.' if ENV['POSTMARK_KEY'].blank?
  config.action_mailer.delivery_method = :postmark
  config.action_mailer.default_url_options = { host: "www.cityxcape.com" }
  config.action_mailer.postmark_settings = { api_key: ENV['POSTMARK_KEY'] }
end
