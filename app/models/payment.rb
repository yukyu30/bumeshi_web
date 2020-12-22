class Payment < ApplicationRecord
    has_many :eateries, through:belongings
    has_many :belongings
end
