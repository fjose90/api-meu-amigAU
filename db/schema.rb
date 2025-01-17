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

ActiveRecord::Schema[8.0].define(version: 2025_01_16_193424) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  # Custom types defined in this database.
  # Note that some types may not work with other database engines. Be careful if changing database.
  create_enum "person_type", ["physical", "legal"]

  create_table "people", force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "cpf_cnpj", null: false
    t.date "birth_date", null: false
    t.string "phone"
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "person_type", default: 1, null: false
  end

  create_table "pgmigrations", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.datetime "run_on", precision: nil, null: false
  end
end
