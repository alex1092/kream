# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_09_111409) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apparels", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.string "size"
    t.decimal "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sells", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "sneaker_id", null: false
    t.bigint "apparel_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["apparel_id"], name: "index_sells_on_apparel_id"
    t.index ["sneaker_id"], name: "index_sells_on_sneaker_id"
    t.index ["user_id"], name: "index_sells_on_user_id"
  end

  create_table "sneakers", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.integer "size"
    t.decimal "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_apparels", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "apparel_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["apparel_id"], name: "index_user_apparels_on_apparel_id"
    t.index ["user_id"], name: "index_user_apparels_on_user_id"
  end

  create_table "user_sneakers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "sneaker_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sneaker_id"], name: "index_user_sneakers_on_sneaker_id"
    t.index ["user_id"], name: "index_user_sneakers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "f_name"
    t.string "l_name"
    t.integer "phone"
    t.date "dob"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "sells", "apparels"
  add_foreign_key "sells", "sneakers"
  add_foreign_key "sells", "users"
  add_foreign_key "user_apparels", "apparels"
  add_foreign_key "user_apparels", "users"
  add_foreign_key "user_sneakers", "sneakers"
  add_foreign_key "user_sneakers", "users"
end
