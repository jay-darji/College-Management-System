require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end

  test "should create student" do
    assert_difference("User.count") do
      post students_url, params: { student: { LastName: @student.LastName, cpi: @student.cpi, degree: @student.degree, department: @student.department, email: @student.email, firstName: @student.firstName, middleName: @student.middleName, mobileNo: @student.mobileNo, studentId: @student.studentId } }
    end

    assert_redirected_to student_url(User.last)
  end

  test "should show student" do
    get student_url(@student)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@student)
    assert_response :success
  end

  test "should update student" do
    patch student_url(@student), params: { student: { LastName: @student.LastName, cpi: @student.cpi, degree: @student.degree, department: @student.department, email: @student.email, firstName: @student.firstName, middleName: @student.middleName, mobileNo: @student.mobileNo, studentId: @student.studentId } }
    assert_redirected_to student_url(@student)
  end

  test "should destroy student" do
    assert_difference("User.count", -1) do
      delete student_url(@student)
    end

    assert_redirected_to students_url
  end
end
