class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: :uuid do |t|
      t.string :provider, null: false
      t.string :uid, null: false
      t.string :name, null: false
      t.string :image,null: false
      t.string :oauth_token, null:false
      t.datetime :oauth_expires_at, null:false

      t.timestamps
    end
  end
end
