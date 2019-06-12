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

ActiveRecord::Schema.define(version: 2019_06_12_030142) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "enrollments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "schedule_id"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.text "title"
    t.text "image"
    t.integer "duration"
    t.string "level"
    t.integer "cost"
    t.text "description"
    t.datetime "start"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "number_of_repeats"
  end

  create_table "schedules_users", force: :cascade do |t|
    t.integer "schedule_id"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.text "image"
    t.text "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_instructor"
  end

end
