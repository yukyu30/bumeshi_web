class Eatery < ApplicationRecord
    has_many :payments, through: :belongings
    has_many :belongings
    scope :search, -> (query) {
        where("name like :q OR category like :q OR addres like :q", q: "%#{query}%") if query.present?
    }
    scope :recent, -> (count){
        order(created_at: :desc).limit(count)
    }
    
end
