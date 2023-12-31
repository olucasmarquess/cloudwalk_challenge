# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_20_133752) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deaths", force: :cascade do |t|
    t.bigint "match_id"
    t.bigint "killer_id"
    t.bigint "killed_id"
    t.string "cause"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["killed_id"], name: "index_deaths_on_killed_id"
    t.index ["killer_id"], name: "index_deaths_on_killer_id"
    t.index ["match_id"], name: "index_deaths_on_match_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "total_kills", default: 0
    t.jsonb "players", default: []
    t.jsonb "kills", default: {}
    t.jsonb "kills_by_means", default: {}
    t.integer "world_kills", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_matches", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "match_id", null: false
    t.integer "kills"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_player_matches_on_match_id"
    t.index ["player_id"], name: "index_player_matches_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "total_kills", default: 0
    t.string "original_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.string "weapon_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapons_useds", force: :cascade do |t|
    t.bigint "weapon_id", null: false
    t.bigint "match_id", null: false
    t.integer "times_used"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_weapons_useds_on_match_id"
    t.index ["weapon_id"], name: "index_weapons_useds_on_weapon_id"
  end

  add_foreign_key "deaths", "matches"
  add_foreign_key "deaths", "players", column: "killed_id"
  add_foreign_key "deaths", "players", column: "killer_id"
  add_foreign_key "player_matches", "matches"
  add_foreign_key "player_matches", "players"
  add_foreign_key "weapons_useds", "matches"
  add_foreign_key "weapons_useds", "weapons"
end
