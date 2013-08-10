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

ActiveRecord::Schema.define(version: 20130810170748) do

  create_table "cateogries", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cateogries", ["category_id"], name: "index_cateogries_on_category_id"

  create_table "children", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "parents_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "children", ["parents_id"], name: "index_children_on_parents_id"

  create_table "classroom_children", id: false, force: true do |t|
    t.integer "child_id"
    t.integer "classroom_id"
  end

  add_index "classroom_children", ["child_id"], name: "index_classroom_children_on_child_id"
  add_index "classroom_children", ["classroom_id"], name: "index_classroom_children_on_classroom_id"

  create_table "classrooms", force: true do |t|
    t.integer  "educator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "classrooms", ["educator_id"], name: "index_classrooms_on_educator_id"

  create_table "educators", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "educators", ["user_id"], name: "index_educators_on_user_id"

  create_table "event_categories", id: false, force: true do |t|
    t.integer "event_id"
    t.integer "category_id"
  end

  add_index "event_categories", ["category_id"], name: "index_event_categories_on_category_id"
  add_index "event_categories", ["event_id"], name: "index_event_categories_on_event_id"

  create_table "events", force: true do |t|
    t.string   "title"
    t.string   "notes"
    t.integer  "classroom_id"
    t.integer  "child_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["child_id"], name: "index_events_on_child_id"
  add_index "events", ["classroom_id"], name: "index_events_on_classroom_id"

  create_table "parents", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "parents", ["user_id"], name: "index_parents_on_user_id"

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
