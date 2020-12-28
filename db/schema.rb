# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_12_28_141108) do

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "eateries", force: :cascade do |t|
    t.string "name", null: false
    t.string "addres", null: false
    t.string "latitude"
    t.string "longitude"
    t.string "parking"
    t.string "url"
    t.string "gnav_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "eatery_category_relations", force: :cascade do |t|
    t.integer "eatery_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_eatery_category_relations_on_category_id"
    t.index ["eatery_id"], name: "index_eatery_category_relations_on_eatery_id"
  end

  create_table "eatery_payment_relations", force: :cascade do |t|
    t.integer "eatery_id", null: false
    t.integer "payment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["eatery_id"], name: "index_eatery_payment_relations_on_eatery_id"
    t.index ["payment_id"], name: "index_eatery_payment_relations_on_payment_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "eatery_id", null: false
    t.integer "price", null: false
    t.integer "rate", null: false
    t.text "comment", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["eatery_id"], name: "index_reviews_on_eatery_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "eatery_category_relations", "categories"
  add_foreign_key "eatery_category_relations", "eateries"
  add_foreign_key "eatery_payment_relations", "eateries"
  add_foreign_key "eatery_payment_relations", "payments"
  add_foreign_key "reviews", "eateries"
  add_foreign_key "reviews", "users"
end
