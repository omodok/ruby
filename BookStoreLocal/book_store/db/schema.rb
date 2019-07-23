# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_07_18_071722) do

  create_table "orders", force: :cascade do |t|
    t.string "syohin"
    t.text "jusyo"
    t.string "shimei"
    t.string "denwa"
    t.string "mailadd"
    t.string "seibetu"
    t.integer "nenrei"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "sended_at"
  end

  create_table "products", force: :cascade do |t|
    t.integer "store_id"
    t.text "syohin"
    t.string "taisyo"
    t.string "hontai"
    t.string "tyosya"
    t.string "teisai"
    t.text "naiyo"
    t.string "img_path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.string "shimei"
    t.text "jusyo"
    t.string "denwa"
    t.string "seibetu"
    t.integer "nenrei"
    t.string "cus_id"
    t.string "last4"
    t.string "meigi"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
