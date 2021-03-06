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

ActiveRecord::Schema.define(:version => 20101018041146) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.string   "cname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bucket_permissions", :force => true do |t|
    t.integer  "bucket_id"
    t.integer  "user_id"
    t.boolean  "admin"
    t.boolean  "moderator"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "buckets", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
  end

  create_table "comments", :force => true do |t|
    t.integer  "post_id"
    t.integer  "author_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score_counter", :default => 0
    t.integer  "parent_id"
    t.integer  "account_id"
  end

  create_table "posts", :force => true do |t|
    t.integer  "bucket_id"
    t.integer  "author_id"
    t.string   "title"
    t.string   "url"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "score_counter",    :default => 0
    t.datetime "last_activity_at"
    t.integer  "account_id"
  end

  create_table "roles", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "site_configurations", :force => true do |t|
    t.string   "display_name"
    t.string   "signup_password"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "google_analytics"
    t.string   "short_name"
    t.text     "site_description"
    t.string   "home_url"
    t.boolean  "private_site",      :default => false
    t.integer  "default_bucket_id"
    t.integer  "account_id"
    t.string   "alternate_rss_url"
    t.boolean  "use_disqus",        :default => false
    t.string   "disqus_identifier"
  end

  create_table "users", :force => true do |t|
    t.string   "first"
    t.string   "last"
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "single_access_token"
    t.boolean  "bookmarklet_installed", :default => false
    t.integer  "account_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token"
  add_index "users", ["username"], :name => "index_users_on_username"

  create_table "votes", :force => true do |t|
    t.integer  "voter_id"
    t.integer  "post_id"
    t.integer  "comment_id"
    t.datetime "created_at"
    t.integer  "score",      :default => 1
  end

end
