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

ActiveRecord::Schema.define(version: 20160311102026) do

  create_table "campaigns", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candidates", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "campaign_id"
    t.integer  "candidate_id"
    t.string   "validity"
    t.string   "conn"
    t.integer  "msisdn",       limit: 8
    t.string   "guid"
    t.integer  "shortcode"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "votes", ["campaign_id"], name: "index_votes_on_campaign_id"
  add_index "votes", ["candidate_id"], name: "index_votes_on_candidate_id"

end
