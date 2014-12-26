class Screen < ActiveRecord::Base
  include SecureAttachable

  validates_uniqueness_of :screen_name, case_sensitive: false
  validates_presence_of :screen_name  

  has_attached_file :location_image,
                    styles: { large: '900x300#', card: '300x300>', thumb: '100x100>' },
                    default_url: ''
  has_destroyable_file :location_image
  validates_image_attachment :location_image
end
