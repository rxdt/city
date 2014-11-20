module CapybaraHelpers
  include Devise::TestHelpers
  include Warden::Test::Helpers
  Warden.test_mode!

  def sign_in_as user
    login_as user
  end

  def sign_out
    logout(:user)
  end

  def teardown
    Warden.test_reset!
  end

end
