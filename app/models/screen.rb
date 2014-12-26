class Screen < ActiveRecord::Base
  validates_uniqueness_of :screen_name, case_sensitive: false
  validates_presence_of :screen_name  
end
