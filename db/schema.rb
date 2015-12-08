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

ActiveRecord::Schema.define(version: 20151208135846) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

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
    t.string "slug"
    t.string "bibliography"
    t.string "image_content_type"
  end

  add_index "members", ["slug"], name: "index_members_on_slug", unique: true, using: :btree

  create_table "news_articles", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "image_id"
    t.string   "document_id"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_filename"
    t.string   "slug"
    t.date     "date"
    t.string   "image_content_type"
  end

  add_index "news_articles", ["slug"], name: "index_news_articles_on_slug", unique: true, using: :btree

  create_table "publications", force: :cascade do |t|
    t.string   "title"
    t.string   "document_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_filename"
    t.string   "description"
    t.date     "date"
    t.text     "summary"
    t.string   "link"
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
    t.string "slug"
    t.text   "summary"
    t.string "image_id"
    t.string "image_content_type"
  end

  add_index "themes", ["slug"], name: "index_themes_on_slug", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
  end

end
