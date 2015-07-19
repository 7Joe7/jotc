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

ActiveRecord::Schema.define(version: 20150719120647) do

  create_table "messages", force: true do |t|
    t.text     "content"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["email", "created_at"], name: "index_messages_on_email_and_created_at"
  add_index "messages", ["user_id", "created_at"], name: "index_messages_on_user_id_and_created_at"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "news", force: true do |t|
    t.string   "content"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "sphere"
  end

  add_index "news", ["author_id"], name: "index_news_on_author_id"

  create_table "reservations", force: true do |t|
    t.datetime "time_from"
    t.datetime "time_to"
    t.integer  "user_id"
    t.string   "place"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "repeat"
  end

  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "place"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "visits", force: true do |t|
    t.string   "ip"
    t.string   "page"
    t.datetime "created_at"
  end

end
