class CreateEateryCategoryRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :eatery_category_relations do |t|
      t.references :eatery, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
