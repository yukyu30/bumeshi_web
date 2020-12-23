class EateryPaymentRelation < ApplicationRecord
  belongs_to :eatery
  belongs_to :payment
end
