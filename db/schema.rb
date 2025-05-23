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

ActiveRecord::Schema[7.2].define(version: 2025_05_08_181329) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "body_parts", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exersizes", force: :cascade do |t|
    t.string "comment"
    t.boolean "countable", default: true
    t.bigint "body_part_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["body_part_id"], name: "index_exersizes_on_body_part_id"
    t.index ["user_id"], name: "index_exersizes_on_user_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.string "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_trainings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "workout_sets", force: :cascade do |t|
    t.string "comment"
    t.bigint "training_id", null: false
    t.bigint "exersize_id", null: false
    t.integer "sets", null: false
    t.integer "reps", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exersize_id"], name: "index_workout_sets_on_exersize_id"
    t.index ["training_id"], name: "index_workout_sets_on_training_id"
  end
end
