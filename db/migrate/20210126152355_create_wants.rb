class CreateWants < ActiveRecord::Migration[6.1]
  def change
    create_table :wants, id: :uuid do |t|
      t.references :user, type: :uuid, null: false, foreign_key: true
      t.string :eatery_name, null: false
      t.string :eatery_addres
      t.string :memo

      t.timestamps
    end
  end
end
