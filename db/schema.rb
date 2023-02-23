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

ActiveRecord::Schema[7.0].define(version: 2022_11_16_062104) do
  create_table "addresses", charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.string "houseNo"
    t.string "nameOfSocietyOrAppartment"
    t.string "landmark"
    t.string "city"
    t.string "district"
    t.string "state"
    t.string "nation"
    t.string "postalCode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "userId", null: false
    t.index ["userId"], name: "addresses_userId_uindex", unique: true
  end

  create_table "courses", charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.string "courseId"
    t.string "courseName"
    t.column "semester", "set('1','2','3','4','5','6','7','8')", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "batch", null: false
    t.string "department", null: false
  end

  create_table "faculty_academic_informations", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "courseId", null: false
    t.bigint "facultyId", null: false
    t.datetime "updated_at", null: false
    t.datetime "created_at", null: false
    t.index ["courseId"], name: "faculty_college_informations_courseId_uindex", unique: true
    t.index ["facultyId"], name: "faculty_academic_informations_users_id_fk"
  end

  create_table "parental_informations", charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.bigint "userId", null: false
    t.string "fatherName"
    t.string "motherName"
    t.bigint "fatherMobileNo"
    t.bigint "motherMobileNo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["userId"], name: "parental_informations_userId_uindex", unique: true
  end

  create_table "student_academic_informations", charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.bigint "studentId", null: false
    t.integer "currentSemester"
    t.float "cpi"
    t.string "batch"
    t.string "department"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["studentId"], name: "student_college_informations_students_id_fk", unique: true
  end

  create_table "users", charset: "utf8mb3", collation: "utf8mb3_unicode_ci", force: :cascade do |t|
    t.string "firstName"
    t.string "middleName"
    t.string "LastName"
    t.string "mobileNo"
    t.string "email"
    t.string "gender", limit: 10, null: false
    t.string "role"
    t.string "password_digest"
    t.string "password_confirmation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "users", column: "userId", name: "addresses_users_id_fk"
  add_foreign_key "faculty_academic_informations", "courses", column: "courseId", name: "faculty_academic_informations_courses_id_fk"
  add_foreign_key "faculty_academic_informations", "users", column: "facultyId", name: "faculty_academic_informations_users_id_fk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "parental_informations", "users", column: "userId", name: "parental_informations_users_id_fk"
  add_foreign_key "student_academic_informations", "users", column: "studentId", name: "student_academic_informations_users_id_fk"
end
