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

ActiveRecord::Schema.define(version: 20170401043639) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admins", force: :cascade do |t|
    t.string   "name",                   default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "association_admins", force: :cascade do |t|
    t.string   "name",                   default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "no",                     default: "", null: false
    t.integer  "blood_id",                            null: false
    t.string   "dp"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["blood_id"], name: "index_association_admins_on_blood_id"
    t.index ["email"], name: "index_association_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_association_admins_on_reset_password_token", unique: true
  end

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_blogs_on_member_id"
  end

  create_table "bloods", force: :cascade do |t|
    t.string   "group",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "complaints", force: :cascade do |t|
    t.text     "content"
    t.integer  "sendable_id"
    t.string   "sendable_type"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "sendable_id"
    t.string   "sendable_type"
    t.integer  "recipientable_id"
    t.string   "recipientable_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "poster"
    t.integer  "residence_association_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["residence_association_id"], name: "index_events_on_residence_association_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string   "no",                       default: "",                  null: false
    t.string   "name",                     default: "",                  null: false
    t.decimal  "lat",                      default: "8.524139100000001", null: false
    t.decimal  "lng",                      default: "76.93663760000004", null: false
    t.integer  "residence_association_id"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.index ["residence_association_id"], name: "index_houses_on_residence_association_id"
  end

  create_table "members", force: :cascade do |t|
    t.string   "name",                   default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "no",                     default: "",    null: false
    t.integer  "blood_id",                               null: false
    t.integer  "house_id",                               null: false
    t.boolean  "admin",                  default: false, null: false
    t.date     "dob"
    t.string   "occupation"
    t.string   "designation"
    t.float    "income"
    t.text     "office_address"
    t.decimal  "mobile"
    t.decimal  "office_number"
    t.decimal  "residence_number"
    t.string   "dp"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["blood_id"], name: "index_members_on_blood_id"
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["house_id"], name: "index_members_on_house_id"
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "conversation_id"
    t.integer  "sender_id"
    t.string   "sender_type"
    t.string   "content"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "content"
    t.integer  "activator_id"
    t.string   "activator_type"
    t.integer  "eventable_id"
    t.string   "eventable_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "image"
    t.integer  "uploadable_id"
    t.string   "uploadable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "residence_associations", force: :cascade do |t|
    t.string   "name",                 default: "",                  null: false
    t.string   "subdomain",            default: "",                  null: false
    t.string   "description",          default: "",                  null: false
    t.decimal  "lat",                  default: "8.524139100000001", null: false
    t.decimal  "lng",                  default: "76.93663760000004", null: false
    t.integer  "association_admin_id",                               null: false
    t.boolean  "approved",             default: false
    t.string   "logo"
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.index ["association_admin_id"], name: "index_residence_associations_on_association_admin_id"
  end

end
