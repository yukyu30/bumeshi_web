class Category < ApplicationRecord
    has_many :eatery_category_relations, dependent: :delete_all
    has_many :eateries, through: :eatery_category_relations
end