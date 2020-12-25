# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Payment.create!(
    [
        { name: 'クレジットカード' },
        { name: 'Pay Pay' },
        { name: 'LINE Pay' },
        { name: 'au PAY' },
        { name: 'd払い' },
        { name: '楽天ペイ'}
    ]    
)
Category.create!(
    [
        {name: '和食'},
        {name: '中華'},
        {name: 'イタリアン'},
        {name: '肉'},
        {name: '海鮮'},
        {name: 'カフェ'},
        {name: 'ラーメン'},
    ]
)