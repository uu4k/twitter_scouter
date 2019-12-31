# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_31_063556) do

  create_table "anchor_requests", force: :cascade do |t|
    t.string "event_tweet_id"
    t.string "hash_tag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "anchors", force: :cascade do |t|
    t.integer "position"
    t.integer "anchor_requests_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["anchor_requests_id"], name: "index_anchors_on_anchor_requests_id"
  end

  create_table "tweet_pools", force: :cascade do |t|
    t.integer "anchor_requests_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["anchor_requests_id"], name: "index_tweet_pools_on_anchor_requests_id"
  end

  create_table "tweets", force: :cascade do |t|
    t.integer "tweet_pools_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tweet_pools_id"], name: "index_tweets_on_tweet_pools_id"
  end

  add_foreign_key "anchors", "anchor_requests", column: "anchor_requests_id"
  add_foreign_key "tweet_pools", "anchor_requests", column: "anchor_requests_id"
  add_foreign_key "tweets", "tweet_pools", column: "tweet_pools_id"
end
