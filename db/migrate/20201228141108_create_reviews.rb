class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :eatery, null: false, foreign_key: true
      t.integer :price, null: false
      t.integer :rate, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
