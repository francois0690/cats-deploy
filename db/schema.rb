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

ActiveRecord::Schema.define(version: 2021_01_16_103204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "animals", force: :cascade do |t|
    t.boolean "is_available", default: true
    t.string "name"
    t.string "description"
    t.string "espece"
    t.string "race"
    t.date "birth_date"
    t.string "sex"
    t.boolean "sterilized", default: true
    t.string "hair"
    t.string "color"
    t.string "size"
    t.boolean "cat_compatible", default: true
    t.boolean "dog_compatible", default: true
    t.boolean "child_compatible", default: true
    t.boolean "handicap", default: false
    t.string "contact"
    t.date "added_date"
    t.string "added_by"
    t.string "host_name"
    t.integer "price"
    t.date "adoption_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "configs", force: :cascade do |t|
    t.bigint "theme_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["theme_id"], name: "index_configs_on_theme_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "animal_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["animal_id"], name: "index_favorites_on_animal_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "name"
    t.string "basic_description"
    t.string "full_description"
    t.string "email"
    t.string "phone"
    t.string "address"
    t.string "legal_mention"
    t.string "siret_number"
    t.string "twitter_url"
    t.string "facebook_url"
    t.string "instagram_url"
    t.string "background_color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "pdf"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "civility"
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.string "phone"
    t.boolean "is_admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "configs", "themes"
  add_foreign_key "favorites", "animals"
  add_foreign_key "favorites", "users"
end
