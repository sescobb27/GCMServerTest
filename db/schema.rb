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

ActiveRecord::Schema.define(:version => 20130507182027) do

  create_table "categories", :force => true do |t|
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "category_name",        :limit => 15, :null => false
    t.string   "category_description"
  end

  create_table "coupons", :force => true do |t|
    t.integer  "coupon_num",                                                :null => false
    t.string   "coupon_name",               :limit => 20,                   :null => false
    t.string   "coupon_msg",                :limit => 50,                   :null => false
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
    t.boolean  "coupon_state",                            :default => true
    t.string   "coupon_image_file_name"
    t.string   "coupon_image_content_type"
    t.integer  "coupon_image_file_size"
    t.datetime "coupon_image_updated_at"
    t.integer  "entity_id",                                                 :null => false
  end

  create_table "entities", :force => true do |t|
    t.string   "entity_name",             :limit => 20, :null => false
    t.string   "entity_email",            :limit => 20, :null => false
    t.string   "entity_telephone_number", :limit => 10, :null => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  add_index "entities", ["entity_name"], :name => "index_entities_on_entity_name", :unique => true

  create_table "entity_categories", :force => true do |t|
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "entity_id",   :null => false
    t.integer  "category_id", :null => false
  end

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

  create_table "receivers", :force => true do |t|
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "gcm_device_id", :null => false
    t.integer  "user_id",       :null => false
  end

  create_table "type_categories", :force => true do |t|
    t.integer  "type_id",     :null => false
    t.integer  "category_id", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "types", :force => true do |t|
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "type_name",        :limit => 15, :null => false
    t.string   "type_description"
  end

  create_table "user_entities", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "entity_id",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.date     "birthday"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
