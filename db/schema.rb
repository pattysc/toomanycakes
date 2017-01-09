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

ActiveRecord::Schema.define(version: 20170109210840) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "name"
  end

  create_table "meals", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "expiration"
    t.string   "img_url"
    t.integer  "cook_id"
    t.index ["cook_id"], name: "index_meals_on_cook_id", using: :btree
  end

  create_table "portions", force: :cascade do |t|
    t.integer "meal_id"
    t.integer "eater_id"
    t.index ["eater_id"], name: "index_portions_on_eater_id", using: :btree
    t.index ["meal_id"], name: "index_portions_on_meal_id", using: :btree
  end

  create_table "user_groups", force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
    t.index ["group_id"], name: "index_user_groups_on_group_id", using: :btree
    t.index ["user_id"], name: "index_user_groups_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "address"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
