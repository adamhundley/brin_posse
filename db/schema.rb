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

ActiveRecord::Schema.define(version: 20160323025007) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pairing_sessions", force: :cascade do |t|
    t.integer  "complete",   default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "user_pairings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "pairing_session_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "user_pairings", ["pairing_session_id"], name: "index_user_pairings_on_pairing_session_id", using: :btree
  add_index "user_pairings", ["user_id"], name: "index_user_pairings_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "fullname"
    t.string   "email"
    t.string   "github"
    t.string   "cohort"
    t.integer  "exercisms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_foreign_key "user_pairings", "pairing_sessions"
  add_foreign_key "user_pairings", "users"
end