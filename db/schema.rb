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

ActiveRecord::Schema.define(version: 20131123235235) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ae_specs", force: true do |t|
    t.text     "content"
    t.integer  "promo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "airtimes", force: true do |t|
    t.integer  "sheet_id"
    t.time     "time"
    t.string   "timezone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "promos", force: true do |t|
    t.integer  "length"
    t.string   "quantel_name"
    t.string   "s4m_name"
    t.integer  "mcr_number"
    t.date     "purge_date"
    t.integer  "sheet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", force: true do |t|
    t.string   "name"
    t.string   "image_path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sheets", force: true do |t|
    t.boolean  "sens"
    t.boolean  "flames"
    t.boolean  "oilers"
    t.boolean  "van_hky"
    t.boolean  "world"
    t.boolean  "one"
    t.boolean  "east"
    t.boolean  "ontario"
    t.boolean  "west"
    t.boolean  "pacific"
    t.boolean  "is_360"
    t.boolean  "snipe_required"
    t.string   "weekday1"
    t.string   "weekday2"
    t.string   "weekday3"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "property_id"
    t.date     "event_date"
    t.date     "due_date"
    t.text     "note"
    t.string   "team1"
    t.string   "team2"
    t.string   "property_name"
  end

  create_table "tbl_specs", force: true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sheet_id"
  end

  create_table "teamnames", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
