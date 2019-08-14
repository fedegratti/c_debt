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

ActiveRecord::Schema.define(version: 20190731220242) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "debts", force: :cascade do |t|
    t.string   "title"
    t.integer  "amount"
    t.boolean  "paid"
    t.integer  "user_id"
    t.integer  "owner_id"
    t.integer  "purchase_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["owner_id"], name: "index_debts_on_owner_id"
    t.index ["purchase_id"], name: "index_debts_on_purchase_id"
    t.index ["user_id"], name: "index_debts_on_user_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.string   "name"
    t.integer  "amount"
    t.boolean  "paid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.string   "name"
    t.integer  "amount"
    t.boolean  "paid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["friend_id"], name: "index_relationships_on_friend_id"
    t.index ["user_id"], name: "index_relationships_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["session_id"], name: "index_sessions_on_session_id", unique: true
    t.index ["updated_at"], name: "index_sessions_on_updated_at"
  end

  create_table "user_settings", force: :cascade do |t|
    t.string   "key"
    t.string   "value"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_user_settings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin"
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
