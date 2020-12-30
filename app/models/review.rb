class Review < ApplicationRecord
  belongs_to :user
  belongs_to :eatery
  has_one_attached :image
  validates :rate, presence: true
  validates :price, presence: true
  validates :comment, presence: true
end
