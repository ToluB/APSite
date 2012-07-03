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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120703045643) do

  create_table "collegeprefs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "college_id"
    t.string   "pref"
    t.text     "exp"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "collegeprefs", ["college_id"], :name => "index_collegeprefs_on_college_id"
  add_index "collegeprefs", ["user_id", "college_id"], :name => "index_collegeprefs_on_user_id_and_college_id"
  add_index "collegeprefs", ["user_id"], :name => "index_collegeprefs_on_user_id"

  create_table "colleges", :force => true do |t|
    t.string   "name"
    t.string   "region"
    t.string   "state"
    t.integer  "usnrank"
    t.integer  "satmed"
    t.float    "gpamed"
    t.float    "acceptrate"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "convos", :force => true do |t|
    t.integer  "user_id"
    t.integer  "subject_id"
    t.integer  "merits",     :default => 0
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "convos", ["subject_id"], :name => "index_convos_on_subject_id"
  add_index "convos", ["user_id"], :name => "index_convos_on_user_id"

  create_table "examprefs", :force => true do |t|
    t.string   "user_id"
    t.string   "exam_id"
    t.boolean  "taken"
    t.datetime "datetaken"
    t.integer  "score"
    t.text     "exp1"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "examprefs", ["exam_id"], :name => "index_examprefs_on_exam_id"
  add_index "examprefs", ["user_id", "exam_id"], :name => "index_examprefs_on_user_id_and_exam_id"
  add_index "examprefs", ["user_id"], :name => "index_examprefs_on_user_id"

  create_table "exams", :force => true do |t|
    t.string   "name"
    t.integer  "subject_id"
    t.datetime "nextadm"
    t.datetime "lastadm"
    t.integer  "passrt"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "exams", ["subject_id"], :name => "index_exams_on_subject_id"

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "convo_id"
    t.integer  "merits",     :default => 0
    t.integer  "skill"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "ancestry"
  end

  add_index "posts", ["ancestry"], :name => "index_posts_on_ancestry"

  create_table "relationships", :force => true do |t|
    t.integer  "tracked_id"
    t.integer  "tracker_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "relationships", ["tracked_id", "tracker_id"], :name => "index_relationships_on_tracked_id_and_tracker_id", :unique => true
  add_index "relationships", ["tracked_id"], :name => "index_relationships_on_tracked_id"
  add_index "relationships", ["tracker_id"], :name => "index_relationships_on_tracker_id"

  create_table "subjects", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "name"
    t.integer  "area_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "school"
    t.string   "colleges"
    t.string   "past_exams"
    t.string   "current_exams"
    t.integer  "merits",                 :default => 0
    t.integer  "umerits",                :default => 0
    t.integer  "gradelevel"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "rank"
    t.string   "pic_url"
    t.datetime "bday"
    t.string   "location"
    t.string   "avatar"
    t.float    "gpa"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
