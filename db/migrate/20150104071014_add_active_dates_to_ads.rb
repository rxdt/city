class AddActiveDatesToAds < ActiveRecord::Migration
  def change
    add_column :ads, :start, :date
    add_column :ads, :end, :date
  end
end
