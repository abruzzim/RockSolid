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

ActiveRecord::Schema.define(:version => 20140116130811) do

  create_table "addresses", :force => true do |t|
    t.string   "street",      :limit => 25
    t.string   "city",        :limit => 25
    t.string   "state",       :limit => 2
    t.string   "zip",         :limit => 10
    t.decimal  "lat",                       :precision => 10, :scale => 6
    t.decimal  "log",                       :precision => 10, :scale => 6
    t.integer  "customer_id"
    t.integer  "delivery_id"
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
  end

  create_table "cargos", :force => true do |t|
    t.decimal  "quantity",   :precision => 4, :scale => 1
    t.integer  "order_id"
    t.datetime "created_at",                               :null => false
    t.datetime "updated_at",                               :null => false
  end

  create_table "customers", :force => true do |t|
    t.string   "name",       :limit => 25
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "deliveries", :force => true do |t|
    t.date     "ship_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "drivers", :force => true do |t|
    t.string   "name",        :limit => 25
    t.integer  "delivery_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "orders", :force => true do |t|
    t.string   "order_num",   :limit => 25
    t.integer  "customer_id"
    t.integer  "delivery_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "rocks", :force => true do |t|
    t.string   "rtype",      :limit => 25
    t.string   "rgrade",     :limit => 25
    t.string   "rform",      :limit => 25
    t.decimal  "rthickness",               :precision => 3, :scale => 1
    t.decimal  "unit_price",               :precision => 9, :scale => 2
    t.integer  "cargo_id"
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
  end

  create_table "trucks", :force => true do |t|
    t.string   "lic_plate",   :limit => 10
    t.decimal  "capacity",                  :precision => 4, :scale => 1
    t.integer  "delivery_id"
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
  end

end
