# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_11_173241) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.integer "interview_identifier"
    t.string "title"
    t.text "description"
    t.datetime "time"
    t.string "uuid"
    t.datetime "discarded_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["discarded_at"], name: "index_events_on_discarded_at"
    t.index ["interview_identifier"], name: "index_events_on_interview_identifier"
  end

  create_table "interviews", force: :cascade do |t|
    t.integer "participant_identifier"
    t.integer "round"
    t.datetime "interview_date"
    t.integer "age"
    t.string "grade"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "discarded_at"
    t.integer "identifier"
    t.index ["discarded_at"], name: "index_interviews_on_discarded_at"
    t.index ["identifier"], name: "index_interviews_on_identifier", unique: true
    t.index ["participant_identifier"], name: "index_interviews_on_participant_identifier"
  end

  create_table "participants", force: :cascade do |t|
    t.integer "identifier"
    t.string "participant_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "site"
    t.datetime "discarded_at"
    t.index ["discarded_at"], name: "index_participants_on_discarded_at"
    t.index ["identifier"], name: "index_participants_on_identifier", unique: true
  end

end
