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

ActiveRecord::Schema.define(version: 20160606183301) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chapters", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.boolean  "inductor_destination"
    t.integer  "state_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id"

  create_table "experiences", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incidents", force: :cascade do |t|
    t.datetime "date"
    t.integer  "city_id"
    t.string   "post_code"
    t.string   "location"
    t.string   "tourist_attraction"
    t.string   "description"
    t.integer  "user_id"
    t.string   "contact"
    t.integer  "sub_category_id"
    t.integer  "chapter_id"
    t.integer  "purpose_id"
    t.string   "proposal_for_action"
    t.boolean  "following",            default: false, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "occurrence_factor_id"
    t.integer  "property_usage_id"
    t.string   "property_company"
    t.string   "tourist_guide"
    t.integer  "property_signaling"
    t.integer  "equipment_failure"
    t.integer  "adequacy_to_norms"
  end

  add_index "incidents", ["occurrence_factor_id"], name: "index_incidents_on_occurrence_factor_id"

  create_table "incidents_tags", id: false, force: :cascade do |t|
    t.integer "incident_id"
    t.integer "tag_id"
  end

  add_index "incidents_tags", ["incident_id"], name: "index_incidents_tags_on_incident_id"
  add_index "incidents_tags", ["tag_id"], name: "index_incidents_tags_on_tag_id"

  create_table "institutions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "occurrence_factors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "property_usages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purposes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "severities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sources", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.string   "text"
    t.string   "file"
    t.integer  "incident_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "sub_categories", ["category_id"], name: "index_sub_categories_on_category_id"

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.integer  "roles",                  default: 0
    t.integer  "institution_id"
    t.integer  "supervisor_id"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.datetime "locked_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["institution_id"], name: "index_users_on_institution_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["supervisor_id"], name: "index_users_on_supervisor_id"

# Could not dump table "victims" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

end
