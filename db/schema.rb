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

ActiveRecord::Schema.define(:version => 20121220152014) do

  create_table "categories", :force => true do |t|
    t.string   "en_name"
    t.string   "cn_name"
    t.integer  "parent_id",  :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "coupons", :force => true do |t|
    t.integer  "status",     :default => 0
    t.string   "password"
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "coupons", ["password"], :name => "index_coupons_on_password"
  add_index "coupons", ["product_id"], :name => "index_coupons_on_product_id"
  add_index "coupons", ["user_id"], :name => "index_coupons_on_user_id"

  create_table "districts", :force => true do |t|
    t.string   "en_name"
    t.string   "cn_name"
    t.integer  "parent_id",  :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "products", :force => true do |t|
    t.integer  "status",        :default => 0
    t.string   "title"
    t.string   "image"
    t.float    "discount"
    t.datetime "begin_at"
    t.datetime "end_at"
    t.string   "address"
    t.string   "phone"
    t.integer  "sale_count"
    t.float    "pos_x"
    t.float    "pos_y"
    t.text     "content"
    t.integer  "category_id"
    t.integer  "district_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "discount_type", :default => 0
    t.float    "price"
    t.string   "specific"
  end

  add_index "products", ["category_id"], :name => "index_products_on_category_id"
  add_index "products", ["district_id"], :name => "index_products_on_district_id"
  add_index "products", ["status"], :name => "index_products_on_status"
  add_index "products", ["title"], :name => "index_products_on_title"
  add_index "products", ["updated_at"], :name => "index_products_on_updated_at"

  create_table "simple_captcha_data", :force => true do |t|
    t.string   "key",        :limit => 40
    t.string   "value",      :limit => 6
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "simple_captcha_data", ["key"], :name => "idx_key"

  create_table "supers", :force => true do |t|
    t.string   "name",                   :default => "", :null => false
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
  end

  add_index "supers", ["name"], :name => "index_supers_on_name", :unique => true
  add_index "supers", ["reset_password_token"], :name => "index_supers_on_reset_password_token", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name",                   :default => "", :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "mobile",                 :default => "", :null => false
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
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
