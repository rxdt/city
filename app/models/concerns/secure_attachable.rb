module SecureAttachable
  extend ActiveSupport::Concern

  included do
    before_save :assign_asset_key
  end

  def assign_asset_key
    self.asset_key ||= generate_asset_key
  end

  def generate_asset_key
    SecureRandom.hex(10)
  end

  module ClassMethods
    def validates_image_attachment attribute
      validates_attachment_content_type attribute, content_type: /\Aimage\/.*\Z/
    end
  end
end
