# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_10_11_162936) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "calculator_inputs", force: :cascade do |t|
    t.jsonb "data", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "calculators", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.text "description"
    t.boolean "visibility", default: false, null: false
    t.jsonb "api_call", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_calculators_on_slug", unique: true
  end

  create_table "project_calculators", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "calculator_id", null: false
    t.bigint "calculator_input_id"
    t.string "label"
    t.string "status", default: "pending", null: false
    t.jsonb "result"
    t.text "error_message"
    t.timestamptz "ran_at"
    t.integer "duration_ms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calculator_id"], name: "index_project_calculators_on_calculator_id"
    t.index ["calculator_input_id"], name: "index_project_calculators_on_calculator_input_id"
    t.index ["project_id", "calculator_id"], name: "index_project_calculators_on_project_id_and_calculator_id"
    t.index ["project_id"], name: "index_project_calculators_on_project_id"
    t.index ["status"], name: "index_project_calculators_on_status"
    t.check_constraint "status::text = ANY (ARRAY['pending'::character varying, 'running'::character varying, 'success'::character varying, 'error'::character varying]::text[])", name: "project_calculators_status_check"
  end

  create_table "project_members", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "user_id", null: false
    t.string "role", default: "owner", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id", "user_id"], name: "index_project_members_on_project_id_and_user_id", unique: true
    t.index ["project_id"], name: "index_project_members_on_project_id"
    t.index ["user_id"], name: "index_project_members_on_user_id"
    t.check_constraint "role::text = ANY (ARRAY['owner'::character varying, 'edit'::character varying, 'read'::character varying]::text[])", name: "project_members_role_check"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "project_calculators", "calculator_inputs"
  add_foreign_key "project_calculators", "calculators"
  add_foreign_key "project_calculators", "projects"
  add_foreign_key "project_members", "projects"
  add_foreign_key "project_members", "users"
end
