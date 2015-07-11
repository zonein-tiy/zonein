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

ActiveRecord::Schema.define(version: 20150711174252) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "athlete_plans", id: false, force: :cascade do |t|
    t.integer "athlete_id", null: false
    t.integer "plan_id",    null: false
    t.string  "start_date"
    t.string  "end_date"
  end

  create_table "athlete_teams", id: false, force: :cascade do |t|
    t.integer "team_id",    null: false
    t.integer "athlete_id", null: false
  end

  create_table "athlete_workouts", id: false, force: :cascade do |t|
    t.integer "athlete_id", null: false
    t.integer "workout_id", null: false
  end

  create_table "athletes", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "email"
    t.string   "home_address"
    t.string   "city"
    t.string   "state"
    t.string   "image_url"
    t.string   "interests"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "access_token"
    t.integer  "zip"
    t.string   "phone_number"
    t.string   "password"
  end

  create_table "plan_workouts", id: false, force: :cascade do |t|
    t.integer "plan_id",          null: false
    t.integer "workout_id",       null: false
    t.integer "workout_interval"
  end

  create_table "plans", force: :cascade do |t|
    t.string  "name"
    t.string  "description"
    t.boolean "completion"
    t.string  "created_by"
    t.integer "creator_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "sport"
    t.string   "image_url"
    t.datetime "season_start"
    t.datetime "season_end"
    t.string   "city"
    t.string   "state"
    t.integer  "coach_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.string  "name"
    t.string  "description"
    t.integer "time"
    t.string  "image_url"
    t.string  "video_url"
    t.boolean "running",          default: false
    t.boolean "weightlifting",    default: false
    t.text    "steps"
    t.integer "creator_id"
    t.boolean "swimming",         default: false
    t.boolean "circuit_training", default: false
    t.boolean "cycling",          default: false
  end

end
