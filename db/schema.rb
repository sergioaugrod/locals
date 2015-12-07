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

ActiveRecord::Schema.define(version: 20151003144354) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "group_images", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "group_images", ["group_id"], name: "index_group_images_on_group_id", using: :btree
  add_index "group_images", ["user_id"], name: "index_group_images_on_user_id", using: :btree

  create_table "group_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "group_users", ["group_id"], name: "index_group_users_on_group_id", using: :btree
  add_index "group_users", ["user_id"], name: "index_group_users_on_user_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.integer  "creator_id"
    t.string   "name"
    t.decimal  "latitude",          precision: 15, scale: 10
    t.decimal  "longitude",         precision: 15, scale: 10
    t.boolean  "active",                                      default: true
    t.boolean  "private",                                     default: false
    t.string   "password"
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  add_index "groups", ["creator_id"], name: "index_groups_on_creator_id", using: :btree
  add_index "groups", ["latitude", "longitude"], name: "index_groups_on_latitude_and_longitude", using: :btree
  add_index "groups", ["latitude"], name: "index_groups_on_latitude", using: :btree
  add_index "groups", ["longitude"], name: "index_groups_on_longitude", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_foreign_key "group_images", "groups"
  add_foreign_key "group_images", "users"
  add_foreign_key "group_users", "groups"
  add_foreign_key "group_users", "users"
  add_foreign_key "groups", "users", column: "creator_id"
end
