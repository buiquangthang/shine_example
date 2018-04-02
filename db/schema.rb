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

ActiveRecord::Schema.define(version: 20180402023053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street", null: false
    t.string "city", null: false
    t.bigint "state_id", null: false
    t.string "zipcode", null: false
    t.index ["state_id"], name: "index_addresses_on_state_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "username", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index "lower((email)::text)", name: "index_customers_on_lower_email"
    t.index "lower((first_name)::text) varchar_pattern_ops", name: "index_customers_on_lower_first_name_varchar_pattern_ops"
    t.index "lower((last_name)::text) varchar_pattern_ops", name: "index_customers_on_lower_last_name_varchar_pattern_ops"
    t.index ["email"], name: "index_customers_on_email", unique: true
    t.index ["username"], name: "index_customers_on_username", unique: true
  end

  create_table "customers_billing_addresses", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "address_id", null: false
    t.index ["address_id"], name: "index_customers_billing_addresses_on_address_id"
    t.index ["customer_id"], name: "index_customers_billing_addresses_on_customer_id"
  end

  create_table "customers_shipping_addresses", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "address_id", null: false
    t.boolean "primary", default: false, null: false
    t.index ["address_id"], name: "index_customers_shipping_addresses_on_address_id"
    t.index ["customer_id"], name: "index_customers_shipping_addresses_on_customer_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
