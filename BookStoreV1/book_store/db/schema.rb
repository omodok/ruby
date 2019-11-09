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

ActiveRecord::Schema.define(version: 2019_07_02_104744) do

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

end