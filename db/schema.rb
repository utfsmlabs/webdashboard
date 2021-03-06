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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130724034424) do

  create_table "pcs", force: true do |t|
    t.string   "lab"
    t.string   "name"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phrases", force: true do |t|
    t.integer  "number"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "servers", force: true do |t|
    t.string   "name"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shifts", force: true do |t|
    t.string   "turn"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "task_comments", force: true do |t|
    t.string   "comment_user"
    t.string   "message"
    t.datetime "message_date"
    t.integer  "task_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "task_comments", ["task_id"], name: "index_task_comments_on_task_id"

  create_table "tasks", force: true do |t|
    t.string   "name"
    t.integer  "number"
    t.string   "status"
    t.integer  "percentage"
    t.string   "assigned_user"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
