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

ActiveRecord::Schema.define(version: 20170102194423) do

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "exams", force: :cascade do |t|
    t.integer  "subject_id"
    t.integer  "professor_id"
    t.datetime "start_date"
    t.string   "department"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "exams", ["professor_id"], name: "index_exams_on_professor_id"
  add_index "exams", ["subject_id"], name: "index_exams_on_subject_id"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "description", default: "Enter description"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "professors", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name",    null: false
    t.string   "last_name",     null: false
    t.integer  "year",          null: false
    t.string   "department",    null: false
    t.datetime "date_of_birth"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id"

  create_table "signups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "exam_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "signups", ["exam_id"], name: "index_signups_on_exam_id"
  add_index "signups", ["user_id"], name: "index_signups_on_user_id"

  create_table "subjects", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "ects",       null: false
    t.integer  "year",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end