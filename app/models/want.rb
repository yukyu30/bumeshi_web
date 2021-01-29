class Want < ApplicationRecord
    belongs_to :user
    validates :eatery_name, presence: true
end
