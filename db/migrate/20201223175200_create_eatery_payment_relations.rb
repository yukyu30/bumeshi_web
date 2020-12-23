class CreateEateryPaymentRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :eatery_payment_relations do |t|
      t.references :eatery, null: false, foreign_key: true
      t.references :payment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
