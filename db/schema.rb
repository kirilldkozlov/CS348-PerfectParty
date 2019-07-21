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

ActiveRecord::Schema.define(version: 2019_07_21_162148) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.integer "street_num", null: false
    t.string "street_name", null: false
    t.string "postal_code"
    t.string "city"
    t.string "province"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "client_addresses", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "address_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_client_addresses_on_address_id"
    t.index ["client_id", "address_id"], name: "unique_client_and_address", unique: true
    t.index ["client_id"], name: "index_client_addresses_on_client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "telephone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "decor_items", force: :cascade do |t|
    t.bigint "decor_id", null: false
    t.bigint "item_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["decor_id"], name: "index_decor_items_on_decor_id"
    t.index ["item_id"], name: "index_decor_items_on_item_id"
  end

  create_table "decors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ent_items", force: :cascade do |t|
    t.bigint "ent_id", null: false
    t.bigint "item_id", null: false
    t.integer "quantity"
    t.integer "ord"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ent_id"], name: "index_ent_items_on_ent_id"
    t.index ["item_id"], name: "index_ent_items_on_item_id"
  end

  create_table "ents", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_items", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "event_id", null: false
    t.bigint "supplier_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_items_on_event_id"
    t.index ["item_id"], name: "index_event_items_on_item_id"
    t.index ["supplier_id"], name: "index_event_items_on_supplier_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "venue_id"
    t.bigint "menu_id"
    t.bigint "decor_id"
    t.bigint "ent_id"
    t.integer "attendees"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_events_on_client_id"
    t.index ["decor_id"], name: "index_events_on_decor_id"
    t.index ["ent_id"], name: "index_events_on_ent_id"
    t.index ["menu_id"], name: "index_events_on_menu_id"
    t.index ["venue_id", "date"], name: "single_event_per_date_and_venue", unique: true
    t.index ["venue_id"], name: "index_events_on_venue_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "item_type", default: 0, null: false
    t.string "name", null: false
    t.string "url"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_items", force: :cascade do |t|
    t.bigint "menu_id", null: false
    t.bigint "item_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_menu_items_on_item_id"
    t.index ["menu_id"], name: "index_menu_items_on_menu_id"
  end

  create_table "menus", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "supplier_id", null: false
    t.text "comment"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "index_ratings_on_supplier_id"
  end

  create_table "supplier_items", force: :cascade do |t|
    t.bigint "supplier_id", null: false
    t.bigint "item_id", null: false
    t.integer "quantity"
    t.decimal "cost", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_supplier_items_on_item_id"
    t.index ["supplier_id"], name: "index_supplier_items_on_supplier_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "telephone"
    t.integer "events_supplied"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "venue_addresses", force: :cascade do |t|
    t.bigint "venue_id", null: false
    t.bigint "address_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_venue_addresses_on_address_id"
    t.index ["venue_id", "address_id"], name: "unique_venue_and_address", unique: true
    t.index ["venue_id"], name: "index_venue_addresses_on_venue_id"
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.decimal "cost", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "client_addresses", "addresses"
  add_foreign_key "client_addresses", "clients"
  add_foreign_key "decor_items", "decors"
  add_foreign_key "decor_items", "items"
  add_foreign_key "ent_items", "ents"
  add_foreign_key "ent_items", "items"
  add_foreign_key "event_items", "events"
  add_foreign_key "event_items", "items"
  add_foreign_key "event_items", "suppliers"
  add_foreign_key "events", "clients"
  add_foreign_key "events", "decors"
  add_foreign_key "events", "ents"
  add_foreign_key "events", "menus"
  add_foreign_key "events", "venues"
  add_foreign_key "menu_items", "items"
  add_foreign_key "menu_items", "menus"
  add_foreign_key "ratings", "suppliers"
  add_foreign_key "supplier_items", "items"
  add_foreign_key "supplier_items", "suppliers"
  add_foreign_key "venue_addresses", "addresses"
  add_foreign_key "venue_addresses", "venues"
end
