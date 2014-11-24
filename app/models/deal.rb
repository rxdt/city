class Deal < ActiveRecord::Base
  validates_uniqueness_of :company_name, case_sensitive: false
  validates_presence_of :company_name  
end
