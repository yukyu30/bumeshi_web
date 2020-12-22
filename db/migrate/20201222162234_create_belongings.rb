class CreateBelongings < ActiveRecord::Migration[6.1]
  def change
    create_table :belongings do |t|
      t.string :name
      integer :eatery_id
      integer :payment_id
      t.timestamps
    end
  end
end
