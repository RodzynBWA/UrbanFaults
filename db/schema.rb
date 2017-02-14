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

ActiveRecord::Schema.define(version: 20161024194148) do

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "department_assignments", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "department_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "department_assignments", ["department_id"], name: "index_department_assignments_on_department_id", using: :btree
  add_index "department_assignments", ["user_id"], name: "index_department_assignments_on_user_id", using: :btree

  create_table "departments", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "report_categories", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "reports", force: :cascade do |t|
    t.string   "title",              limit: 255, null: false
    t.string   "house",              limit: 255
    t.string   "short_place_desc",   limit: 255
    t.string   "descr",              limit: 255, null: false
    t.string   "state",              limit: 255, null: false
    t.string   "ip",                 limit: 255, null: false
    t.string   "report_image",       limit: 255
    t.integer  "user_id",            limit: 4,   null: false
    t.integer  "city_id",            limit: 4,   null: false
    t.integer  "street_id",          limit: 4,   null: false
    t.integer  "report_category_id", limit: 4,   null: false
    t.integer  "department_id",      limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "reports", ["city_id"], name: "index_reports_on_city_id", using: :btree
  add_index "reports", ["department_id"], name: "index_reports_on_department_id", using: :btree
  add_index "reports", ["report_category_id"], name: "index_reports_on_report_category_id", using: :btree
  add_index "reports", ["street_id"], name: "index_reports_on_street_id", using: :btree
  add_index "reports", ["user_id"], name: "index_reports_on_user_id", using: :btree

  create_table "statements", force: :cascade do |t|
    t.string   "title",      limit: 255, null: false
    t.string   "content",    limit: 255, null: false
    t.integer  "user_id",    limit: 4,   null: false
    t.integer  "report_id",  limit: 4,   null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "statements", ["report_id"], name: "index_statements_on_report_id", using: :btree
  add_index "statements", ["user_id"], name: "index_statements_on_user_id", using: :btree

  create_table "streets", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "city_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "streets", ["city_id"], name: "index_streets_on_city_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 255,                 null: false
    t.string   "first_name",      limit: 255,                 null: false
    t.string   "last_name",       limit: 255,                 null: false
    t.string   "password_digest", limit: 255,                 null: false
    t.integer  "ps_level",        limit: 4,   default: 0,     null: false
    t.boolean  "is_banned",                   default: false, null: false
    t.integer  "city_id",         limit: 4,                   null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "users", ["city_id"], name: "index_users_on_city_id", using: :btree

  add_foreign_key "department_assignments", "departments"
  add_foreign_key "department_assignments", "users"
  add_foreign_key "reports", "cities"
  add_foreign_key "reports", "departments"
  add_foreign_key "reports", "report_categories"
  add_foreign_key "reports", "streets"
  add_foreign_key "reports", "users"
  add_foreign_key "statements", "reports"
  add_foreign_key "statements", "users"
  add_foreign_key "streets", "cities"
  add_foreign_key "users", "cities"
end
