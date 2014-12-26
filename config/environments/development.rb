Rails.application.configure do
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.action_mailer.raise_delivery_errors = true
  config.active_support.deprecation = :log
  config.active_record.migration_error = :page_load
  config.assets.debug = true
  config.assets.raise_runtime_errors = true
  config.action_mailer.default_url_options = { host: 'localhost', port: 5000 }
  config.action_mailer.delivery_method = :letter_opener

  # Ensure sprokets_better_errors doesn't choke on sections_rails
  # assets:
  config.assets.raise_runtime_errors = false
  
  #######
  # Use the toggle below to switch between s3 and local file storage for paperclip attachments.
  # If you change this value, be sure to change it back to 'false' prior to shipment of a feature branch!
  #######
  use_s3_in_development = false
  #######
  if use_s3_in_development
    fail 'Need to set AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY in environment.' if ENV['AWS_ACCESS_KEY_ID'].blank? || ENV['AWS_SECRET_ACCESS_KEY'].blank?
    config.paperclip_defaults = { storage: :s3,
                                  path: ':secret_asset_key/:style/:filename',
                                  s3_credentials: { bucket: 'cityxcape-dev' } }
  else
    config.paperclip_defaults = { url: '/system/uploads/:secret_asset_key/:style/:filename' }
  end
end
