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

ActiveRecord::Schema.define(:version => 20121024173452) do

  create_table "comments", :force => true do |t|
    t.string   "text"
    t.string   "author_name"
    t.string   "author_email"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "galleries", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "background"
    t.boolean  "has_rating"
    t.boolean  "has_comments"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "show_headline",      :default => true
    t.integer  "top_margin",         :default => 0
    t.string   "text_color",         :default => "#000000"
    t.string   "headline_color",     :default => "#000000"
    t.boolean  "photo_border",       :default => false
    t.string   "photo_border_color", :default => "#000000"
    t.integer  "photo_border_width", :default => 1
    t.integer  "site_width"
    t.string   "thumb_size",         :default => "medium"
    t.string   "background_color",   :default => "#ffffff"
  end

  create_table "photos", :force => true do |t|
    t.string   "caption"
    t.string   "owner"
    t.string   "image"
    t.boolean  "is_active"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "gallery_id"
  end

end
