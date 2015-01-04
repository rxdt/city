class Ad < ActiveRecord::Base
  include SecureAttachable  

  belongs_to :screen
  belongs_to :user

  has_attached_file :ad_image,
                    styles: { large: '900x300#', card: '300x300>', thumb: '100x100>' },
                    default_url: ''
  has_destroyable_file :ad_image
  validates_image_attachment :ad_image

  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false ) }
end
