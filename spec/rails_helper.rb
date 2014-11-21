ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include CapybaraHelpers, type: :feature
  config.include Devise::TestHelpers, type: :controller
  config.include ApiHelpers, api: true
  config.include FactoryGirl::Syntax::Methods

  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
end
