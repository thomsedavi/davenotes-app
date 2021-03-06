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

ActiveRecord::Schema.define(version: 20160720065506) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_users", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "user_id"
    t.boolean  "active",     default: false
    t.boolean  "admin",      default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["course_id"], name: "index_course_users_on_course_id", using: :btree
    t.index ["user_id"], name: "index_course_users_on_user_id", using: :btree
  end

  create_table "courses", force: :cascade do |t|
    t.string   "title"
    t.string   "code"
    t.integer  "school_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_courses_on_school_id", using: :btree
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "course_id"
    t.text     "message"
    t.string   "controller"
    t.string   "target"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_notifications_on_course_id", using: :btree
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.string   "website"
    t.string   "primary_colour",   default: "Orange"
    t.string   "secondary_colour", default: "Green"
    t.string   "text_colour",      default: "Black"
    t.boolean  "active",           default: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
