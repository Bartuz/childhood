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

ActiveRecord::Schema.define(version: 20130810190257) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_category_id"
  end

  add_index "categories", ["category_id"], name: "index_categories_on_category_id"
  add_index "categories", ["parent_category_id"], name: "index_categories_on_parent_category_id"

  create_table "categories_events", id: false, force: true do |t|
    t.integer "event_id"
    t.integer "category_id"
  end

  create_table "children", force: true do |t|
    t.string   "first_name",  null: false
    t.string   "last_name",   null: false
    t.date     "birthdate",   null: false
    t.integer  "parent_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picutre_url"
  end

  add_index "children", ["parent_id"], name: "index_children_on_parent_id"

  create_table "children_educators", id: false, force: true do |t|
    t.integer "child_id",    null: false
    t.integer "educator_id", null: false
  end

  add_index "children_educators", ["child_id", "educator_id"], name: "index_children_educators_on_child_id_and_educator_id"
  add_index "children_educators", ["educator_id", "child_id"], name: "index_children_educators_on_educator_id_and_child_id"

  create_table "childrens_categories", id: false, force: true do |t|
    t.integer "child_id"
    t.integer "classroom_id"
  end

  create_table "classrooms", force: true do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.integer  "educator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "classrooms", ["educator_id"], name: "index_classrooms_on_educator_id"

  create_table "classrooms_teachers", id: false, force: true do |t|
    t.integer "classroom_id", null: false
    t.integer "teacher_id",   null: false
  end

  add_index "classrooms_teachers", ["classroom_id", "teacher_id"], name: "index_classrooms_teachers_on_classroom_id_and_teacher_id"
  add_index "classrooms_teachers", ["teacher_id", "classroom_id"], name: "index_classrooms_teachers_on_teacher_id_and_classroom_id"

  create_table "educators", force: true do |t|
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "educators", ["user_id"], name: "index_educators_on_user_id"

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
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "parents", ["user_id"], name: "index_parents_on_user_id"

  create_table "users", force: true do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.string   "email",      null: false
    t.string   "password",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
