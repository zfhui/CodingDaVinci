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

ActiveRecord::Schema.define(version: 20150729204861) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buildings", force: :cascade do |t|
    t.string   "name",                            null: false
    t.float    "longitude",         default: 0.0
    t.float    "latitude",          default: 0.0
    t.integer  "built_from"
    t.integer  "built_to"
    t.integer  "built_from_2"
    t.integer  "built_to_2"
    t.text     "description",       default: ""
    t.string   "wiki_url",          default: ""
    t.string   "wiki_common_url",   default: ""
    t.string   "denkmalliste_url",  default: ""
    t.string   "grossstadt_url",    default: ""
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "architect"
    t.string   "architect_2"
    t.string   "architect_3"
    t.string   "other_url"
    t.string   "other_url_2"
    t.text     "comments"
    t.integer  "tour_id"
    t.string   "street_name",       default: ""
    t.string   "house_no",          default: ""
    t.string   "zipcode",           default: ""
    t.string   "city",              default: ""
    t.string   "country",           default: ""
    t.string   "video_url",         default: ""
    t.integer  "tour_position"
    t.text     "video_description", default: ""
  end

  add_index "buildings", ["tour_id"], name: "index_buildings_on_tour_id", using: :btree

  create_table "index_cards", force: :cascade do |t|
    t.string   "photographer",      default: "", null: false
    t.text     "architect",         default: "", null: false
    t.string   "building_name",     default: "", null: false
    t.string   "place",             default: "", null: false
    t.string   "systematic",        default: ""
    t.string   "ownership",         default: ""
    t.string   "filename",          default: "", null: false
    t.integer  "no_of_photos",      default: 0
    t.string   "inventory_date",                 null: false
    t.string   "creditline",        default: "", null: false
    t.text     "content",           default: ""
    t.integer  "year_taken"
    t.string   "original_filename", default: "", null: false
    t.string   "flickr_name",                    null: false
    t.string   "url_t",             default: "", null: false
    t.string   "url_s",             default: "", null: false
    t.string   "url_sq",            default: "", null: false
    t.string   "url_m",             default: "", null: false
    t.string   "url_o",             default: "", null: false
    t.string   "pathalias",         default: "", null: false
    t.integer  "title",                          null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "literatures", force: :cascade do |t|
    t.string   "author"
    t.string   "title"
    t.string   "subtitle"
    t.string   "published_at"
    t.string   "publisher"
    t.integer  "year"
    t.string   "cover_file"
    t.string   "url"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "path"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "index_card_no"
    t.string   "photo_no"
    t.string   "photographer"
    t.integer  "year"
    t.string   "classification"
    t.string   "building_name"
    t.string   "address"
    t.text     "content"
    t.string   "ownership"
    t.string   "creditline"
    t.integer  "building_id"
    t.string   "flickr_url"
    t.text     "comments"
    t.text     "keywords"
  end

  add_index "photos", ["building_id"], name: "index_photos_on_building_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "tours", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "description", default: ""
    t.string   "image_path",  default: ""
    t.text     "comments",    default: ""
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
