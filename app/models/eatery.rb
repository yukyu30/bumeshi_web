class Eatery < ApplicationRecord
    has_many :eatery_payment_relations, dependent: :delete_all
    has_many :payments, through: :eatery_payment_relations
    scope :search, -> (query) {
        where("name like :q OR category like :q OR addres like :q", q: "%#{query}%") if query.present?
    }
    scope :recent, -> (count){
        order(created_at: :desc).limit(count)
    }
    
end
