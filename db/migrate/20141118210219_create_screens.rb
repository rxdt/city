class CreateScreens < ActiveRecord::Migration
  def change
    create_table :screens do |t|
      t.string   :screen_name, null: false
      t.string   :address
      t.text     :description
      t.string   :demographic
      t.integer  :foot_traffic
      t.string   :operating_hours

      t.timestamps
    end
  end
end
