class Transaction < ActiveRecord::Base
  belongs_to :users
  belongs_to :ads
end
