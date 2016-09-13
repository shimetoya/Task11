# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160825141117) do

  create_table "cars", force: :cascade do |t|
    t.integer  "amount_top_seats"
    t.integer  "amount_bottom_seats"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "train_id"
    t.integer  "number"
    t.string   "type"
    t.integer  "amount_side_top_seats"
    t.integer  "amount_side_bottom_seats"
    t.integer  "amount_sitting_seats"
  end

  create_table "routes", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations_routes", force: :cascade do |t|
    t.integer  "route_id"
    t.integer  "station_id"
    t.datetime "arrival_time"
    t.datetime "departure_time"
    t.integer  "station_number"
  end

  create_table "tickets", force: :cascade do |t|
    t.string   "fio"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id"
    t.integer  "train_id"
    t.integer  "first_station_id"
    t.integer  "last_station_id"
    t.string   "passport_information"
  end

  create_table "trains", force: :cascade do |t|
    t.string   "number"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "current_station_id"
    t.integer  "route_id"
  end

  create_table "trains_routes", force: :cascade do |t|
    t.integer "train_id"
    t.integer "route_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
