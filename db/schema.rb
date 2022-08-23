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

ActiveRecord::Schema.define(version: 2022_08_22_062639) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrations", force: :cascade do |t|
    t.string "name", null: false
    t.string "homepage", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "libraries", force: :cascade do |t|
    t.bigint "administration_id"
    t.string "name"
    t.string "phone_number"
    t.string "post_code"
    t.string "address"
    t.time "open_time"
    t.time "close_time"
    t.string "opening_details"
    t.string "closed_body_first"
    t.string "closed_body_second"
    t.integer "seats"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "lat", precision: 11, scale: 8
    t.decimal "lng", precision: 11, scale: 8
    t.index ["administration_id"], name: "index_libraries_on_administration_id"
  end

end
