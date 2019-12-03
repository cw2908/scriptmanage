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

ActiveRecord::Schema.define(version: 2019_12_03_215156) do

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
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "incidents", force: :cascade do |t|
    t.integer "incident_id"
    t.text "service_now_id"
    t.text "name"
    t.text "description"
    t.text "requester"
    t.text "assignee"
    t.text "state"
    t.text "site"
    t.text "department"
    t.text "category"
    t.text "subcategory"
    t.text "resolution_code"
    t.text "resolution_description"
    t.text "priority"
    t.datetime "samanage_created_at"
    t.datetime "samanage_updated_at"
    t.integer "interface_status"
    t.boolean "has_pending_jobs"
    t.integer "last_comment_id", default: 0
    t.integer "last_attachment_id", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "service_now_number"
    t.integer "number"
  end

  create_table "intercom_chats", force: :cascade do |t|
    t.bigint "chat_id", null: false
    t.integer "comments", default: 0, null: false
    t.integer "case_number"
    t.text "case_id"
    t.text "salesforce_owner_id"
    t.boolean "status", default: true, null: false
    t.datetime "last_update"
    t.integer "last_comment_id"
    t.text "intercom_owner", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "salesforce_owner"
    t.datetime "last_commented"
    t.integer "rating"
    t.text "remark"
    t.string "intercom_status"
    t.boolean "open_in_intercom"
    t.string "salesforce_status"
    t.boolean "open_in_salesforce"
    t.datetime "last_resync_time"
  end

  create_table "salesforce_owners", force: :cascade do |t|
    t.text "sf_id", null: false
    t.text "name", null: false
    t.text "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string "session_id", null: false
    t.text "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "settings", force: :cascade do |t|
    t.boolean "email_alerts"
    t.text "samanage_api_token"
    t.text "webhook_token"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_settings_on_user_id", unique: true
  end

  create_table "uploads", force: :cascade do |t|
    t.string "attachment_type", null: false
    t.string "file_file_name", null: false
    t.string "file_content_type", null: false
    t.bigint "file_file_size", null: false
    t.datetime "file_updated_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approved", default: false, null: false
    t.string "role", default: "user", null: false
    t.index ["approved"], name: "index_users_on_approved"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "settings", "users"
end
