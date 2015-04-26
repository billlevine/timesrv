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

ActiveRecord::Schema.define(version: 0) do

  create_table "aliases", primary_key: "Alias", force: true do |t|
    t.integer "UserId", null: false
  end

  add_index "aliases", ["UserId"], name: "IDX_UserID", using: :btree

  create_table "codes", primary_key: "ID", force: true do |t|
    t.string "Description", limit: 100, null: false
  end

  create_table "departments", primary_key: "name", force: true do |t|
    t.integer "manager"
  end

  add_index "departments", ["manager"], name: "fk_manager", using: :btree

  create_table "deprecated_employees", primary_key: "username", force: true do |t|
    t.string "display_name", limit: 45
    t.string "department",   limit: 45
  end

  add_index "deprecated_employees", ["department"], name: "FK_employee_department", using: :btree

  create_table "emailgroups", primary_key: "idEmailGroups", force: true do |t|
    t.string "email_adr", limit: 128
  end

  create_table "estimates", id: false, force: true do |t|
    t.integer "ewo",     null: false
    t.integer "hours",   null: false
    t.integer "user_id", null: false
  end

  add_index "estimates", ["ewo"], name: "FK_estimates_ewo", using: :btree
  add_index "estimates", ["user_id"], name: "FK_estimates_userid", using: :btree

  create_table "ewos", primary_key: "ewo", force: true do |t|
    t.string "description", limit: 45
    t.string "department",  limit: 45
    t.string "version",     limit: 45
    t.string "status",      limit: 8,   default: "active"
    t.string "EwoType",     limit: 100, default: "EWO",    null: false
  end

  add_index "ewos", ["department"], name: "FK_ewos_department", using: :btree

  create_table "exceptions", primary_key: "Id", force: true do |t|
    t.string  "Details", limit: 10000
    t.integer "UserId"
    t.string  "Time",    limit: 45
    t.string  "Version", limit: 45,    default: "Unknown", null: false
  end

  create_table "time_logs", primary_key: "idtime_logs", force: true do |t|
    t.integer  "ewo",                          default: 9999, null: false
    t.float    "time",                                        null: false
    t.string   "task_id",          limit: 45
    t.string   "task_description", limit: 256,                null: false
    t.integer  "task_revision"
    t.datetime "date",                                        null: false
    t.string   "code",             limit: 100, default: "0"
    t.integer  "user_id"
  end

  add_index "time_logs", ["ewo"], name: "FK_time_logs_ewo", using: :btree
  add_index "time_logs", ["user_id"], name: "FK_time_logs_userid", using: :btree

  create_table "timesheettemplates", primary_key: "Id", force: true do |t|
    t.integer "UserId",                                null: false
    t.string  "Name",      limit: 100,                 null: false
    t.boolean "IsDefault",             default: false
  end

  add_index "timesheettemplates", ["UserId"], name: "FK_Templates_UserId_Users_Id", using: :btree

  create_table "timesheettemplateworkitems", id: false, force: true do |t|
    t.integer "TemplateId",              null: false
    t.integer "EWO",                     null: false
    t.string  "Code",        limit: 100, null: false
    t.string  "Description", limit: 256, null: false
    t.float   "Time",                    null: false
  end

  add_index "timesheettemplateworkitems", ["TemplateId"], name: "FK_TimeSheetTemplateWorkitems_TemplateId_TimeSheetTemplates_Id", using: :btree

  create_table "timetrackerversion", primary_key: "Version", force: true do |t|
    t.string "Address", limit: 100, null: false
  end

  create_table "top31in31", id: false, force: true do |t|
    t.float    "total_time",  limit: 17
    t.integer  "ewo",                    default: 9999, null: false
    t.string   "description", limit: 45
    t.datetime "date",                                  null: false
    t.string   "label",       limit: 56
  end

  create_table "user_info", id: false, force: true do |t|
    t.integer "id",                      default: 0, null: false
    t.string  "Name",        limit: 45
    t.string  "Alias",       limit: 200
    t.string  "Email Group", limit: 128
    t.string  "Department",  limit: 45
    t.string  "Manager",     limit: 45
  end

  create_table "users", force: true do |t|
    t.string  "department",                    limit: 45
    t.string  "display_name",                  limit: 45
    t.string  "EwoSortPreference",             limit: 200
    t.boolean "ShowSubmitConfirmationMessage",             default: true, null: false
    t.boolean "AllowMinimizeToTray",                       default: true, null: false
    t.integer "manager"
    t.integer "email_group"
    t.integer "active",                        limit: 1,   default: 1
  end

  add_index "users", ["department"], name: "FK_users_department", using: :btree
  add_index "users", ["department"], name: "fk_department", using: :btree
  add_index "users", ["email_group"], name: "fk_email_group", using: :btree
  add_index "users", ["manager"], name: "fk_direct_mgr", using: :btree

  create_table "web_users", primary_key: "idweb_users", force: true do |t|
    t.string "Name",     limit: 45
    t.string "Password", limit: 45
    t.string "groupid",  limit: 45
    t.string "email",    limit: 200
  end

end
