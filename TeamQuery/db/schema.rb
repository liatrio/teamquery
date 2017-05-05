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

ActiveRecord::Schema.define(version: 20170505190854) do

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "happiness_score"
    t.integer  "happiness_users"
    t.integer  "health_score"
    t.integer  "health_users"
    t.integer  "friendliness_score"
    t.integer  "friendliness_users"
    t.integer  "difficulty_score"
    t.integer  "difficulty_users"
  end

  create_table "questions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "text"
    t.string   "trait"
  end

  create_table "surveys", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "users_id"
    t.integer  "questions_id"
    t.boolean  "taken"
  end

  add_index "surveys", ["questions_id"], name: "index_surveys_on_questions_id"
  add_index "surveys", ["users_id"], name: "index_surveys_on_users_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.integer  "company_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "name"
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id"

end
