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

ActiveRecord::Schema.define(version: 20131214140809) do

  create_table "card_pages", force: true do |t|
    t.string   "name"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "card_pages", ["name"], name: "index_card_pages_on_name", unique: true

  create_table "card_types", force: true do |t|
    t.string   "name"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "card_types", ["name"], name: "index_card_types_on_name", unique: true

  create_table "cards", force: true do |t|
    t.string   "name"
    t.string   "english_name"
    t.string   "link"
    t.string   "img_link"
    t.string   "description"
    t.string   "profession"
    t.string   "type"
    t.string   "card_type"
    t.integer  "cost"
    t.integer  "attack"
    t.integer  "health"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "power"
  end

  add_index "cards", ["name"], name: "index_cards_on_name", unique: true

  create_table "hero_types", force: true do |t|
    t.string   "name"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hero_types", ["name"], name: "index_hero_types_on_name", unique: true

  create_table "heros", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link"
  end

  add_index "heros", ["name"], name: "index_heros_on_name", unique: true

end
