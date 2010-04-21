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

ActiveRecord::Schema.define(:version => 20100411081758) do

  create_table "address_highways", :force => true do |t|
    t.integer  "address_id"
    t.integer  "highway_id"
    t.integer  "distance_to_mkad", :limit => 10, :precision => 10, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "address_subway_stations", :force => true do |t|
    t.integer  "address_id"
    t.integer  "subway_station_id"
    t.integer  "time_to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "addresses", :force => true do |t|
    t.integer  "street_id"
    t.string   "premise"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "administrative_areas", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entries", :force => true do |t|
    t.string   "type"
    t.integer  "rooms_count"
    t.integer  "price",             :limit => 10, :precision => 10, :scale => 0
    t.string   "currency"
    t.integer  "price_type",        :limit => 10, :precision => 10, :scale => 0
    t.integer  "floors_total"
    t.integer  "floor_number"
    t.integer  "total_area"
    t.integer  "kitchen_area"
    t.integer  "house_area"
    t.integer  "plot_area"
    t.integer  "rent_time_type"
    t.integer  "user_id"
    t.integer  "address_id"
    t.string   "realty_type"
    t.integer  "commission_client", :limit => 10, :precision => 10, :scale => 0
    t.integer  "commission_agent",  :limit => 10, :precision => 10, :scale => 0
    t.boolean  "furniture"
    t.boolean  "phone"
    t.boolean  "refridgerator"
    t.boolean  "tv"
    t.boolean  "washing_machine"
    t.text     "contacts"
    t.text     "comment"
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

  create_table "localities", :force => true do |t|
    t.integer  "administrative_area_id"
    t.integer  "sub_administrative_area_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "streets", :force => true do |t|
    t.integer  "locality_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sub_administrative_areas", :force => true do |t|
    t.string   "name"
    t.integer  "administrative_area_id"
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
    t.string   "surname"
    t.string   "login"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "type"
    t.integer  "group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
