class Transaction < ActiveRecord::Base
  belongs_to :user, inverse_of: :Transactions
  has_one :ad

  accepts_nested_attributes_for :ad
end
