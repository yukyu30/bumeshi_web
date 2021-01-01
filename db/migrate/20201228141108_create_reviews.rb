class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews, id: :uuid do |t|
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.references :eatery, type: :uuid, null: false, foreign_key: true
      t.integer :price, null: false
      t.integer :rate, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
