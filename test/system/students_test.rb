require "application_system_test_case"

class StudentsTest < ApplicationSystemTestCase
  setup do
    @student = students(:one)
  end

  test "visiting the index" do
    visit students_url
    assert_selector "h1", text: "Students"
  end

  test "should create student" do
    visit students_url
    click_on "New student"

    fill_in "Lastname", with: @student.LastName
    fill_in "Cpi", with: @student.cpi
    fill_in "Degree", with: @student.degree
    fill_in "Department", with: @student.department
    fill_in "Email", with: @student.email
    fill_in "Firstname", with: @student.firstName
    fill_in "Middlename", with: @student.middleName
    fill_in "Mobileno", with: @student.mobileNo
    fill_in "Studentid", with: @student.studentId
    click_on "Create User"

    assert_text "User was successfully created"
    click_on "Back"
  end

  test "should update User" do
    visit student_url(@student)
    click_on "Edit this student", match: :first

    fill_in "Lastname", with: @student.LastName
    fill_in "Cpi", with: @student.cpi
    fill_in "Degree", with: @student.degree
    fill_in "Department", with: @student.department
    fill_in "Email", with: @student.email
    fill_in "Firstname", with: @student.firstName
    fill_in "Middlename", with: @student.middleName
    fill_in "Mobileno", with: @student.mobileNo
    fill_in "Studentid", with: @student.studentId
    click_on "Update User"

    assert_text "User was successfully updated"
    click_on "Back"
  end

  test "should destroy User" do
    visit student_url(@student)
    click_on "Destroy this student", match: :first

    assert_text "User was successfully destroyed"
  end
end
