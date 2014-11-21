class User < ActiveRecord::Base
  after_initialize :skip_confirmation_notification!
  rolify

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable


end
