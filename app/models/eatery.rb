class Eatery < ApplicationRecord
    has_many :eatery_payment_relations, dependent: :delete_all
    has_many :payments, through: :eatery_payment_relations
    
    has_many :eatery_category_relations, dependent: :delete_all
    has_many :categories, through: :eatery_category_relations
     
    validates :name,
        presence: true
    validates :addres,
        presence: true
    
    scope :search, -> (query) {
        Eatery.joins(:categories).where("eateries.name like :q OR categories.name like :q OR addres like :q", q: "%#{query}%") if query.present?
    }
    scope :recent, -> (count){
        order(created_at: :desc).limit(count)
    }
    
end
