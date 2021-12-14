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

ActiveRecord::Schema.define(version: 2021_12_14_201237) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actors", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competition_teams", force: :cascade do |t|
    t.bigint "competition_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["competition_id"], name: "index_competition_teams_on_competition_id"
    t.index ["team_id"], name: "index_competition_teams_on_team_id"
  end

  create_table "competitions", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "sport"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movie_performers", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "performer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_movie_performers_on_movie_id"
    t.index ["performer_id"], name: "index_movie_performers_on_performer_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.integer "creation_year"
    t.string "genre"
    t.bigint "studio_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["studio_id"], name: "index_movies_on_studio_id"
  end

  create_table "performers", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.bigint "team_id"
    t.string "name"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "studios", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "hometown"
    t.string "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "competition_teams", "competitions"
  add_foreign_key "competition_teams", "teams"
  add_foreign_key "movie_performers", "movies"
  add_foreign_key "movie_performers", "performers"
  add_foreign_key "movies", "studios"
  add_foreign_key "players", "teams"
end
