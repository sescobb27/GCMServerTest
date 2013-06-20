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

ActiveRecord::Schema.define(:version => 20130620075639) do

  create_table "categories", :force => true do |t|
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "category_name",        :limit => 50, :null => false
    t.string   "category_description"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "coupons", :force => true do |t|
    t.integer  "coupon_num",                                                 :null => false
    t.string   "coupon_name",               :limit => 50,                    :null => false
    t.string   "coupon_msg",                :limit => 200,                   :null => false
    t.datetime "created_at",                                                 :null => false
    t.datetime "updated_at",                                                 :null => false
    t.boolean  "coupon_state",                             :default => true
    t.string   "coupon_image_file_name"
    t.string   "coupon_image_content_type"
    t.integer  "coupon_image_file_size"
    t.datetime "coupon_image_updated_at"
    t.integer  "entity_id",                                                  :null => false
  end

  create_table "entities", :force => true do |t|
    t.string   "entity_name",             :limit => 50, :null => false
    t.string   "entity_email",            :limit => 70, :null => false
    t.string   "entity_telephone_number", :limit => 10, :null => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  add_index "entities", ["entity_email"], :name => "index_entities_on_entity_email", :unique => true
  add_index "entities", ["entity_name"], :name => "index_entities_on_entity_name", :unique => true

  create_table "entity_categories", :force => true do |t|
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "entity_id",   :null => false
    t.integer  "category_id", :null => false
  end

  add_index "entity_categories", ["category_id"], :name => "index_entity_categories_on_category_id"
  add_index "entity_categories", ["entity_id"], :name => "index_entity_categories_on_entity_id"

  create_table "gcm_devices", :force => true do |t|
    t.string   "registration_id",    :null => false
    t.datetime "last_registered_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "gcm_devices", ["registration_id"], :name => "index_gcm_devices_on_registration_id", :unique => true

  create_table "gcm_notifications", :force => true do |t|
    t.integer  "device_id",        :null => false
    t.string   "collapse_key"
    t.text     "data"
    t.boolean  "delay_while_idle"
    t.datetime "sent_at"
    t.integer  "time_to_live"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "gcm_notifications", ["device_id"], :name => "index_gcm_notifications_on_device_id"

  create_table "type_categories", :force => true do |t|
    t.integer  "type_id",     :null => false
    t.integer  "category_id", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "type_categories", ["category_id"], :name => "index_type_categories_on_category_id"
  add_index "type_categories", ["type_id"], :name => "index_type_categories_on_type_id"

  create_table "types", :force => true do |t|
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "type_name",            :limit => 15, :null => false
    t.string   "type_description"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  add_index "types", ["type_name"], :name => "index_types_on_type_name", :unique => true

  create_table "user_coupons", :force => true do |t|
    t.integer  "user_id",                  :null => false
    t.integer  "coupon_id",                :null => false
    t.string   "auth_token", :limit => 10, :null => false
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  add_index "user_coupons", ["coupon_id"], :name => "index_user_coupons_on_coupon_id"
  add_index "user_coupons", ["user_id"], :name => "index_user_coupons_on_user_id"

  create_table "user_entities", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "entity_id",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_entities", ["entity_id"], :name => "index_user_entities_on_entity_id"
  add_index "user_entities", ["user_id"], :name => "index_user_entities_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name",          :limit => 80, :null => false
    t.string   "email",         :limit => 70, :null => false
    t.date     "birthday",                    :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "gcm_device_id",               :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
