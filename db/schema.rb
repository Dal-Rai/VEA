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

ActiveRecord::Schema.define(version: 20210323043208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "academic_eligibilities", force: :cascade do |t|
    t.integer  "eligiable_id"
    t.string   "eligiable_type"
    t.string   "eligibility_type"
    t.decimal  "minimum_score"
    t.integer  "code"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.integer  "street_no",        null: false
    t.string   "street_name"
    t.string   "suburb",           null: false
    t.string   "post_code",        null: false
    t.string   "city"
    t.string   "country"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "attachments", force: :cascade do |t|
    t.string   "attachable_type"
    t.integer  "attachable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["attachable_type", "attachable_id"], name: "index_attachments_on_attachable_type_and_attachable_id", using: :btree
  end

  create_table "course_units", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "duration"
    t.integer  "rank"
    t.integer  "faculty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "english_competencies", force: :cascade do |t|
    t.integer  "competency_type"
    t.date     "expiry"
    t.decimal  "overall_band"
    t.decimal  "speaking"
    t.decimal  "reading"
    t.decimal  "writing"
    t.decimal  "listening"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "competenciable_id"
    t.string   "competenciable_type"
  end

  create_table "experiences", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "job_type"
    t.datetime "start"
    t.datetime "end"
    t.string   "company"
    t.text     "responsibility"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "faculties", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "university_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "focal_contacts", force: :cascade do |t|
    t.string   "firstname"
    t.string   "middlename"
    t.string   "lastname"
    t.string   "gender"
    t.string   "email"
    t.string   "phone_number"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "university_id"
  end

  create_table "premium_payments", force: :cascade do |t|
    t.datetime "end_date"
    t.datetime "start_date"
    t.integer  "payable_id"
    t.string   "payable_type"
    t.string   "pay_type"
    t.float    "amount"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "salutation"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "designation"
    t.string   "phone"
    t.integer  "user_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "mobile_no"
    t.string   "gender"
    t.string   "middlename"
    t.string   "passport_no"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "qualifications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "highest_qualification"
    t.string   "course"
    t.decimal  "overall_percentage"
    t.json     "subject",               default: {}
    t.date     "completed_year"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "selection_criteria", force: :cascade do |t|
    t.integer  "university_id"
    t.decimal  "english_competency"
    t.decimal  "academic"
    t.decimal  "experience"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "units", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "credit_point"
    t.integer  "level"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "universities", force: :cascade do |t|
    t.string   "name"
    t.string   "weblink"
    t.text     "remark"
    t.text     "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "role"
    t.integer  "university_id"
    t.string   "token"
    t.integer  "user_type"
    t.boolean  "is_active",              default: false
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.string   "invited_by_type"
    t.integer  "invited_by_id"
    t.integer  "invitations_count",      default: 0
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
    t.index ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

  add_foreign_key "profiles", "users"
end
