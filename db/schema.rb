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

ActiveRecord::Schema.define(:version => 20121012044546) do

  create_table "phones", :force => true do |t|
    t.string   "name",         :null => false
    t.string   "model_name"
    t.string   "manufacturer", :null => false
    t.integer  "ram"
    t.string   "cpu"
    t.string   "gpu"
    t.boolean  "gps"
    t.boolean  "wifi"
    t.float    "bluetooth"
    t.string   "os"
    t.string   "os_version"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
