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

ActiveRecord::Schema.define(version: 20160429192051) do

  create_table "dvds", force: :cascade do |t|
    t.integer  "location_id"
    t.integer  "home_theater_info_id"
    t.text     "note"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "home_theater_infos", force: :cascade do |t|
    t.text     "dvd_title"
    t.string   "studio"
    t.string   "released"
    t.string   "status"
    t.string   "sound"
    t.string   "versions"
    t.string   "price"
    t.string   "rating"
    t.string   "year"
    t.string   "genre"
    t.string   "aspect"
    t.string   "upc"
    t.datetime "dvd_releasedate"
    t.string   "home_theater_info_id"
    t.datetime "timestamp"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "shelf"
    t.string   "row"
    t.string   "stack"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
