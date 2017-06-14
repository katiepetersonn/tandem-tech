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

ActiveRecord::Schema.define(version: 20170610050450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "date"
    t.integer  "teacher_id"
    t.integer  "student_id"
    t.string   "permalink"
    t.integer  "price"
    t.integer  "user_id"
    t.boolean  "available",  default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "bookings_skills", id: false, force: :cascade do |t|
    t.integer "booking_id"
    t.integer "skill_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "teacher_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.text     "skill"
    t.integer  "booking_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills_users", id: false, force: :cascade do |t|
    t.integer "skill_id"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.text     "name"
    t.text     "email"
    t.text     "skills"
    t.text     "learning"
    t.datetime "localtime"
    t.text     "bio"
    t.text     "image"
    t.text     "location"
    t.text     "longitude"
    t.text     "latitude"
    t.text     "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
