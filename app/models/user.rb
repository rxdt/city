class User < ActiveRecord::Base
  include SecureAttachable

  has_and_belongs_to_many :ads
  #has_and_belongs_to_many :transactions
  accepts_nested_attributes_for :ads, allow_destroy: true

  acts_as_token_authenticatable
  after_initialize :skip_confirmation_notification!
  rolify

  validates_presence_of :first_name, allow_nil: false
  validates_presence_of :last_name, allow_nil: false

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

  private

  def password_required?
    new_record? ? false : super
  end
end
