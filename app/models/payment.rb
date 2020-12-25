class Payment < ApplicationRecord
    has_many :eatery_payment_relations, dependent: :delete_all
    has_many :eateries, through: :eatery_payment_relations 
end
