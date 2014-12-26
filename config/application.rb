require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module CityXcapeRails
  class Application < Rails::Application
    config.assets.paths << 'app/sections'
    config.assets.initialize_on_precompile = false
  end
end
