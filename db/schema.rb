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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20200711103638) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.string   "name"
    t.string   "mobile"
    t.date     "desired_date"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "sent_sms",                   default: false
    t.date     "confirmed_date"
    t.string   "address"
    t.integer  "slot_id"
    t.string   "email"
    t.string   "serial"
    t.boolean  "result",                     default: false
    t.boolean  "covid_positive"
    t.string   "district"
    t.string   "upazila"
    t.boolean  "second_time"
    t.boolean  "willing_to_plasma_donation"
    t.string   "gender"
    t.string   "age"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
