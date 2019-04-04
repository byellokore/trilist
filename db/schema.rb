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

ActiveRecord::Schema.define(version: 2019_04_04_044228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_trgm"
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "seo_url"
    t.string "short_url"
    t.datetime "will_happen"
    t.string "address"
    t.datetime "open_to_registration"
    t.datetime "close_to_registration"
    t.jsonb "contacts"
    t.bigint "inviter_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inviter_id"], name: "index_events_on_inviter_id"
  end

  create_table "events_locales", id: false, force: :cascade do |t|
    t.bigint "locale_id", null: false
    t.bigint "event_id", null: false
  end

  create_table "guests", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.decimal "cellphone"
    t.date "birthday"
    t.json "location"
    t.string "confirmation_token"
    t.date "confirmed_at"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "partner_id"
    t.index ["event_id"], name: "index_guests_on_event_id"
    t.index ["partner_id"], name: "index_guests_on_partner_id"
  end

  create_table "inviters", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_inviters_on_confirmation_token", unique: true
    t.index ["email"], name: "index_inviters_on_email", unique: true
    t.index ["reset_password_token"], name: "index_inviters_on_reset_password_token", unique: true
  end

  create_table "locales", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "inviter_id"
    t.index ["inviter_id"], name: "index_locales_on_inviter_id"
  end

  create_table "partners", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.jsonb "phone_numbers"
    t.string "password", null: false
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "password_digest"
    t.string "activation_digest"
    t.boolean "activated"
    t.string "remember_digest"
    t.string "reset_digest"
    t.datetime "reset_send_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "events", "inviters"
  add_foreign_key "guests", "events"
  add_foreign_key "guests", "partners"
  add_foreign_key "locales", "inviters"
end
