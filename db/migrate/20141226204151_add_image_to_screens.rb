class AddImageToScreens < ActiveRecord::Migration
  def change
    add_attachment :screens, :location_image
  end
end
