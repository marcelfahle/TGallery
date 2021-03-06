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

ActiveRecord::Schema.define(:version => 20121210190631) do

  create_table "comments", :force => true do |t|
    t.text     "comment"
    t.string   "author_name"
    t.string   "author_email"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "photo_id"
  end

  add_index "comments", ["photo_id", "created_at"], :name => "index_comments_on_photo_id_and_created_at"

  create_table "emails", :force => true do |t|
    t.string   "from"
    t.string   "to"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "image_thumb"
    t.string   "image_full"
    t.string   "download_link"
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
    t.text     "instructions"
    t.boolean  "show_names",         :default => false
    t.text     "description"
    t.boolean  "is_active"
    t.string   "tos_text"
    t.text     "confirmation_text"
    t.boolean  "has_upload",         :default => true
  end

  create_table "photo_votes", :force => true do |t|
    t.integer  "value"
    t.integer  "photo_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "photos", :force => true do |t|
    t.text     "caption"
    t.string   "owner"
    t.string   "image"
    t.boolean  "is_active"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "gallery_id"
    t.integer  "position"
    t.string   "video"
    t.boolean  "is_video",     :default => false
    t.string   "video_poster"
    t.string   "owner_email"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
