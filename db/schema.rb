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

ActiveRecord::Schema.define(version: 20170628162117) do

  create_table "games", force: :cascade do |t|
    t.integer  "player_1_score", default: 0
    t.integer  "player_2_score", default: 0
    t.datetime "time"
    t.string   "location"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "player_1_id"
    t.integer  "player_2_id"
    t.integer  "winner_id"
  end

  add_index "games", ["player_1_id"], name: "index_games_on_player_1_id"
  add_index "games", ["player_2_id"], name: "index_games_on_player_2_id"
  add_index "games", ["winner_id"], name: "index_games_on_winner_id"

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "recipient_id"
    t.text     "content"
    t.boolean  "private",      default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "points_for",      default: 0
    t.integer  "points_against",  default: 0
    t.integer  "wins",            default: 0
    t.integer  "losses",          default: 0
    t.integer  "wins_count",      default: 0
  end

end
