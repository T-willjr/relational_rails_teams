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

ActiveRecord::Schema.define(version: 2022_02_01_215604) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "basketball_players", force: :cascade do |t|
    t.string "name"
    t.boolean "injured"
    t.integer "jersey_number"
    t.bigint "basketball_team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["basketball_team_id"], name: "index_basketball_players_on_basketball_team_id"
  end

  create_table "basketball_teams", force: :cascade do |t|
    t.string "name"
    t.boolean "winning_record"
    t.integer "titles"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "football_players", force: :cascade do |t|
    t.string "name"
    t.boolean "eligible"
    t.integer "jersey_number"
    t.bigint "football_team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["football_team_id"], name: "index_football_players_on_football_team_id"
  end

  create_table "football_teams", force: :cascade do |t|
    t.string "name"
    t.boolean "public"
    t.integer "titles"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "basketball_players", "basketball_teams"
  add_foreign_key "football_players", "football_teams"
end
