class FacultyAcademicInformation < ApplicationRecord
  belongs_to :course, :foreign_key => "courseId"
  belongs_to :user, :foreign_key => "facultyId"
end
