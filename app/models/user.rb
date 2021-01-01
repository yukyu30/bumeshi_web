class User < ApplicationRecord
    has_many :reviews
    has_one_attached :avatar
    has_secure_password
    
    validates :name,
        presence: true, #必須項目
        uniqueness: true, #重複するIDなし
        length: { maximum: 32 },
        format: {
            with: /\A[a-z0-9_]+\z/,
            message: 'は小文字英数字,アンダーバーで入力してください'
        }
    validates :password,
        length: { minimum: 8 }
end
