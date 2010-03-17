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

ActiveRecord::Schema.define(:version => 20100317100126) do

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entries", :force => true do |t|
    t.string   "type"
    t.integer  "rooms_count"
    t.integer  "rent_price",        :limit => 10, :precision => 10, :scale => 0
    t.string   "city"
    t.string   "street"
    t.string   "house_number"
    t.integer  "flat_number"
    t.integer  "floor_number"
    t.string   "disctrict"
    t.integer  "area_total"
    t.integer  "area_kitchen"
    t.integer  "rent_time"
    t.text     "contacts"
    t.text     "comment"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "realty_type"
    t.string   "currency"
    t.integer  "highway_id"
    t.integer  "plot_area"
    t.integer  "commission_client", :limit => 10, :precision => 10, :scale => 0
    t.integer  "commission_agent",  :limit => 10, :precision => 10, :scale => 0
    t.boolean  "phone"
    t.boolean  "refridgerator"
    t.boolean  "tv"
    t.boolean  "washing_machine"
    t.boolean  "furniture"
    t.integer  "mo_district_id"
    t.string   "rent_time_type"
    t.integer  "distance_to_mkad"
    t.integer  "area_house"
    t.integer  "area_plot"
    t.integer  "city_id"
  end

  create_table "entries_highways", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "entry_id"
    t.integer  "highway_id"
    t.integer  "time_to"
  end

  create_table "entries_subway_stations", :force => true do |t|
    t.integer  "subway_station_id"
    t.integer  "entry_id"
    t.integer  "time_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "phone"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "highways", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mo_districts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subway_stations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "type"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "login"
    t.string   "surname"
  end

end
