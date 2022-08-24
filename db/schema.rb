ActiveRecord::Schema.define(version: 2022_08_24_112253) do

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

  create_table "inventories", force: :cascade do |t|
    t.integer "water", default: 0, null: false
    t.integer "soup", default: 0, null: false
    t.integer "pouch", default: 0, null: false
    t.integer "Ak47", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "total_qty"
    t.index ["user_id"], name: "index_inventories_on_user_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "quantity", null: false
    t.string "item_name", null: false
    t.integer "points", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trade_requests", force: :cascade do |t|
    t.bigint "coming_request_id"
    t.bigint "current_reciever_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coming_request_id"], name: "index_trade_requests_on_coming_request_id"
    t.index ["current_reciever_id"], name: "index_trade_requests_on_current_reciever_id"
  end

  create_table "trades", force: :cascade do |t|
    t.bigint "sending_user_id"
    t.bigint "recieving_user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "waterc"
    t.integer "watere"
    t.integer "pouchc"
    t.integer "pouche"
    t.integer "soupc"
    t.integer "soupe"
    t.integer "ak47c"
    t.integer "ak47e"
    t.integer "request_status", default: 0
    t.index ["recieving_user_id"], name: "index_trades_on_recieving_user_id"
    t.index ["sending_user_id"], name: "index_trades_on_sending_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.integer "user_type", default: 0
    t.integer "age", null: false
    t.string "name", null: false
    t.string "gender", limit: 1, default: "M"
    t.integer "longitude", null: false
    t.integer "latitude", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "vote_sent_id"
    t.bigint "vote_reciever_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vote_reciever_id"], name: "index_votes_on_vote_reciever_id"
    t.index ["vote_sent_id"], name: "index_votes_on_vote_sent_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "inventories", "users"
end
