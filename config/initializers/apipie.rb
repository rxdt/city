Apipie.configure do |config|
  config.app_name                = "VivifyRails"
  config.api_base_url            = "/api/v1"
  config.doc_base_url            = "/api/docs"
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/api/v1/*.rb"
  #config.markup                  = Apipie::Markup::Markdown.new
end
