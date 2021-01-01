class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users,  id: :uuid do |t|
      t.string :name, null:false
      t.string :password_digest, null:false

      t.timestamps
    end
  end
end
