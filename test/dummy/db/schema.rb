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

ActiveRecord::Schema.define(:version => 20120315110556) do

  create_table "boxes", :force => true do |t|
    t.string   "name"
    t.text     "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "items", :force => true do |t|
    t.integer  "box_id"
    t.string   "name"
    t.integer  "quantity"
    t.text     "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "items", ["box_id"], :name => "index_items_on_box_id"

  create_table "things", :force => true do |t|
    t.integer "box_id"
    t.string  "name"
    t.integer "weight"
    t.string  "category"
  end

  add_index "things", ["box_id"], :name => "index_things_on_box_id"
  add_index "things", ["category"], :name => "index_things_on_category"

end
