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

ActiveRecord::Schema.define(version: 20150723020703) do

  create_table "accounts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.decimal  "balance",                precision: 10, scale: 2
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "accounts", ["user_id"], name: "fk_rails_b1e30bebc8", using: :btree

  create_table "transacts", force: :cascade do |t|
    t.decimal  "amount",                 precision: 10, scale: 2
    t.integer  "from_user_id", limit: 4,                          null: false
    t.integer  "to_user_id",   limit: 4,                          null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "transacts", ["to_user_id"], name: "fk_rails_e4c5c1e934", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "email",           limit: 255
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "transacts", "users", column: "to_user_id"
end
