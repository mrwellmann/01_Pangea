# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100615175512) do

  create_table "admins", :force => true do |t|
    t.string   "user_name",                                           :null => false
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                     :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true
  add_index "admins", ["user_name"], :name => "index_admins_on_user_name", :unique => true

  create_table "continents", :force => true do |t|
    t.string   "continent_name", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "continents", ["continent_name"], :name => "index_continents_on_continent_name", :unique => true

  create_table "foodkinds", :force => true do |t|
    t.string   "foodkind_name", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "foodkinds", ["foodkind_name"], :name => "index_foodkinds_on_foodkind_name", :unique => true

  create_table "foods", :force => true do |t|
    t.string   "food_name",                        :null => false
    t.text     "description"
    t.string   "image_url"
    t.integer  "price"
    t.integer  "expirience_points", :default => 0
    t.integer  "continent_id"
    t.integer  "foodkind_id",                      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "foods", ["food_name"], :name => "index_foods_on_food_name", :unique => true

  create_table "foods_menues", :id => false, :force => true do |t|
    t.integer "menue_id", :null => false
    t.integer "food_id",  :null => false
  end

  add_index "foods_menues", ["food_id"], :name => "index_foods_menues_on_food_id"
  add_index "foods_menues", ["menue_id", "food_id"], :name => "index_foods_menues_on_menue_id_and_food_id", :unique => true

  create_table "menues", :force => true do |t|
    t.string   "menue_name",                                                     :null => false
    t.string   "image_url"
    t.text     "description"
    t.decimal  "price",             :precision => 6, :scale => 2
    t.integer  "expirience_points",                               :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menues", ["menue_name"], :name => "index_menues_on_menue_name", :unique => true

  create_table "products", :force => true do |t|
    t.string   "product_name",                                                   :null => false
    t.text     "description"
    t.string   "image_url"
    t.decimal  "price",             :precision => 6, :scale => 2
    t.integer  "expirience_points",                               :default => 0
    t.integer  "continent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["product_name"], :name => "index_products_on_product_name", :unique => true

  create_table "users", :force => true do |t|
    t.string   "user_name",                                           :null => false
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                     :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "street"
    t.string   "place"
    t.string   "zip_code"
    t.string   "country"
    t.integer  "expirience_points",                   :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["user_name"], :name => "index_users_on_user_name", :unique => true

  create_table "wishlists", :force => true do |t|
    t.string   "wishlist_name", :default => "New Wishlist", :null => false
    t.integer  "user_id",                                   :null => false
    t.string   "visibility",    :default => "public",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "wishlists_products", :id => false, :force => true do |t|
    t.integer "wishlist_id", :null => false
    t.integer "user_id",     :null => false
  end

  add_index "wishlists_products", ["user_id", "wishlist_id"], :name => "index_wishlists_products_on_user_id_and_wishlist_id", :unique => true
  add_index "wishlists_products", ["wishlist_id"], :name => "index_wishlists_products_on_wishlist_id"

end
