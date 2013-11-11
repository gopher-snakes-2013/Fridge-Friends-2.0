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

ActiveRecord::Schema.define(:version => 20131111074427) do

  create_table "fridges", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "creator_id"
  end

  create_table "fridges_users", :force => true do |t|
    t.integer  "fridge_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "fridges_users", ["user_id", "fridge_id"], :name => "index_fridges_users_on_user_id_and_fridge_id", :unique => true

  create_table "items", :force => true do |t|
    t.string   "name"
    t.string   "category"
    t.integer  "fridge_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "upc_codes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "upc_img_file_name"
    t.string   "upc_img_content_type"
    t.integer  "upc_img_file_size"
    t.datetime "upc_img_updated_at"
    t.string   "upc_text"
    t.string   "item_name"
    t.integer  "fridge_id"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "email",                             :null => false
    t.string   "encrypted_password", :limit => 128, :null => false
    t.string   "confirmation_token", :limit => 128
    t.string   "remember_token",     :limit => 128, :null => false
    t.string   "name"
    t.string   "phone_number"
    t.string   "customer_id"
    t.boolean  "opted_in"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
