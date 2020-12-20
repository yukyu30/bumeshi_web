class CreateEateries < ActiveRecord::Migration[6.1]
  def change
    create_table :eateries do |t|
      t.string :name 
      t.string :addres
      t.float :latitude
      t.float :longitude
      t.string :category
      t.string :payment 
      t.string :parking

      t.timestamps
    end
  end
end
