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

ActiveRecord::Schema.define(version: 2022_05_03_064327) do

  create_table "budgets", charset: "utf8", force: :cascade do |t|
    t.float "amount"
    t.bigint "organization_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_budgets_on_organization_id"
  end

  create_table "departments", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_departments_on_organization_id"
  end

  create_table "departments_projects", charset: "utf8", force: :cascade do |t|
    t.bigint "department_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_departments_projects_on_department_id"
    t.index ["project_id"], name: "index_departments_projects_on_project_id"
  end

  create_table "offices", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_offices_on_organization_id"
  end

  create_table "offices_projects", charset: "utf8", force: :cascade do |t|
    t.bigint "office_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["office_id"], name: "index_offices_projects_on_office_id"
    t.index ["project_id"], name: "index_offices_projects_on_project_id"
  end

  create_table "organizations", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "persons", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.boolean "is_supervisor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", charset: "utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "organization_id"
    t.string "status"
    t.bigint "budget_id"
    t.bigint "department_id"
    t.bigint "office_id"
    t.string "description"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "person_id"
    t.index ["budget_id"], name: "index_projects_on_budget_id"
    t.index ["department_id"], name: "index_projects_on_department_id"
    t.index ["office_id"], name: "index_projects_on_office_id"
    t.index ["organization_id"], name: "index_projects_on_organization_id"
    t.index ["person_id"], name: "index_projects_on_person_id"
  end

  add_foreign_key "departments_projects", "departments"
  add_foreign_key "departments_projects", "projects"
  add_foreign_key "offices_projects", "offices"
  add_foreign_key "offices_projects", "projects"
  add_foreign_key "projects", "persons"
end
