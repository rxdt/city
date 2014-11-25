require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module VivifyRails
  class Application < Rails::Application
    config.assets.paths << 'app/sections'
  end
end
