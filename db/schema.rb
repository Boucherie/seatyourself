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

ActiveRecord::Schema.define(version: 20170621184411) do

  create_table "diners", force: :cascade do |t|
    t.string   "name"
    t.string   "contact_info"
    t.integer  "reservations_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["reservations_id"], name: "index_diners_on_reservations_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string   "name"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["restaurant_id"], name: "index_owners_on_restaurant_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "date"
    t.integer  "time"
    t.integer  "party_size"
    t.integer  "diner_id"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["diner_id"], name: "index_reservations_on_diner_id"
    t.index ["restaurant_id"], name: "index_reservations_on_restaurant_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.text     "address"
    t.integer  "capacity"
    t.time     "open_time"
    t.time     "close_time"
    t.integer  "reservations_id"
    t.integer  "owner_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "url"
    t.string   "price_range"
    t.string   "neighbourhood"
    t.text     "summary"
    t.index ["owner_id"], name: "index_restaurants_on_owner_id"
    t.index ["reservations_id"], name: "index_restaurants_on_reservations_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "email"
    t.string   "role",            default: "diner", null: false
  end

end
