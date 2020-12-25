class EateryCategoryRelation < ApplicationRecord
  belongs_to :eatery
  belongs_to :category
end
