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

ActiveRecord::Schema.define(version: 20150520083448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "member_publications", force: :cascade do |t|
    t.integer "member_id"
    t.integer "publication_id"
  end

  add_index "member_publications", ["member_id"], name: "index_member_publications_on_member_id", using: :btree
  add_index "member_publications", ["publication_id"], name: "index_member_publications_on_publication_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.text   "address"
    t.string "image_id"
    t.text   "bio"
    t.string "title"
  end

  create_table "news_articles", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "image_id"
    t.string   "document_id"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_filename"
  end

  create_table "publications", force: :cascade do |t|
    t.string   "title"
    t.string   "document_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_filename"
    t.string   "description"
  end

  create_table "theme_members", force: :cascade do |t|
    t.integer "theme_id"
    t.integer "member_id"
  end

  add_index "theme_members", ["member_id"], name: "index_theme_members_on_member_id", using: :btree
  add_index "theme_members", ["theme_id"], name: "index_theme_members_on_theme_id", using: :btree

  create_table "theme_publications", force: :cascade do |t|
    t.integer "theme_id"
    t.integer "publication_id"
  end

  add_index "theme_publications", ["publication_id"], name: "index_theme_publications_on_publication_id", using: :btree
  add_index "theme_publications", ["theme_id"], name: "index_theme_publications_on_theme_id", using: :btree

  create_table "themes", force: :cascade do |t|
    t.string "title"
    t.text   "description"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
  end

end
