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

ActiveRecord::Schema.define(version: 20151104162720) do

  create_table "jobs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "task_id"
    t.string   "task_name"
    t.string   "log"
  end

  add_index "jobs", ["task_id"], name: "index_jobs_on_task_id"

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "default_task_id"
    t.string   "repo"
    t.string   "branch"
  end

  add_index "projects", ["default_task_id"], name: "index_projects_on_default_task_id"
  add_index "projects", ["title"], name: "index_projects_on_title", unique: true

  create_table "tasks", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "command"
  end

  add_index "tasks", ["project_id"], name: "index_tasks_on_project_id"

end
