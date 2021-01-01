class CreateEateries < ActiveRecord::Migration[6.1]
  def change
    create_table :eateries, id: :uuid do |t|
      t.string :name, null:false
      t.string :addres, null:false
      t.string :latitude
      t.string :longitude
      t.string :parking
      t.string :url
      t.string :gnav_id

      t.timestamps
    end
  end
end
