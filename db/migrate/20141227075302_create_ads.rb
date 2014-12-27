class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.attachment  :image
      #t.string      :asset_key, null: false
      t.string      :url
      t.boolean     :active, :boolean, default: true, null: false

      t.timestamps
    end
  end
end
