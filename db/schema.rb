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

ActiveRecord::Schema.define(version: 2019_09_11_054423) do

  create_table "booking_rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "users_id"
    t.datetime "booking_date"
    t.datetime "checkin_date"
    t.datetime "checkout_date"
    t.integer "status", default: 1
    t.string "name"
    t.integer "phone"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_booking_rooms_on_users_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "parents_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "users_id"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_contacts_on_users_id"
  end

  create_table "detail_bookings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "booking_rooms_id"
    t.bigint "rooms_id"
    t.integer "current_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_rooms_id"], name: "index_detail_bookings_on_booking_rooms_id"
    t.index ["rooms_id"], name: "index_detail_bookings_on_rooms_id"
  end

  create_table "reviews", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "rooms_id"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["rooms_id"], name: "index_reviews_on_rooms_id"
    t.index ["users_id"], name: "index_reviews_on_users_id"
  end

  create_table "rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "picture"
    t.text "detail"
    t.float "price"
    t.integer "status", default: 1
    t.bigint "categories_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categories_id"], name: "index_rooms_on_categories_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "phone"
    t.string "password_digest"
    t.string "remember_digest"
    t.integer "role", default: 0
    t.string "activation_digest"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "booking_rooms", "users", column: "users_id"
  add_foreign_key "contacts", "users", column: "users_id"
  add_foreign_key "detail_bookings", "booking_rooms", column: "booking_rooms_id"
  add_foreign_key "detail_bookings", "rooms", column: "rooms_id"
  add_foreign_key "reviews", "rooms", column: "rooms_id"
  add_foreign_key "reviews", "users", column: "users_id"
  add_foreign_key "rooms", "categories", column: "categories_id"
end
