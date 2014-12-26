class User < ActiveRecord::Base
  include SecureAttachable

  acts_as_token_authenticatable
  after_initialize :skip_confirmation_notification!
  rolify

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  def self.authenticate email, password
    user = User.find_for_authentication email: email
    user if user && user.valid_password?(password)
  end
end
