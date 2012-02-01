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

ActiveRecord::Schema.define(:version => 20120129235650) do

  create_table "consents", :force => true do |t|
    t.boolean  "consent"
    t.boolean  "over_18"
    t.string   "signature"
    t.integer  "subject_id"
    t.string   "subject_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "demographics", :force => true do |t|
    t.integer  "subject_id"
    t.string   "subject_type"
    t.string   "gender"
    t.integer  "age"
    t.string   "race"
    t.string   "ethnicity"
    t.string   "education"
    t.string   "twitter_use"
    t.text     "why_twitter"
    t.text     "twitter_story"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "demographics_other_sites", :id => false, :force => true do |t|
    t.integer "demographic_id"
    t.integer "other_site_id"
  end

  create_table "informants", :force => true do |t|
    t.integer  "participant_id"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "observers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "other_sites", :force => true do |t|
    t.string   "site"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participant_ten_items", :force => true do |t|
    t.integer  "subject_id"
    t.string   "subject_type"
    t.integer  "participant_id"
    t.integer  "extraverted"
    t.integer  "critical"
    t.integer  "dependable"
    t.integer  "anxious"
    t.integer  "open"
    t.integer  "reserved"
    t.integer  "sympathetic"
    t.integer  "disorganized"
    t.integer  "calm"
    t.integer  "conventional"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participants", :force => true do |t|
    t.string   "handle"
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ten_items", :force => true do |t|
    t.integer  "subject_id"
    t.string   "subject_type"
    t.integer  "extraverted"
    t.integer  "critical"
    t.integer  "dependable"
    t.integer  "anxious"
    t.integer  "open"
    t.integer  "reserved"
    t.integer  "sympathetic"
    t.integer  "disorganized"
    t.integer  "calm"
    t.integer  "conventional"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "visited"
  end

end
