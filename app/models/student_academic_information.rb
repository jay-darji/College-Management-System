class StudentAcademicInformation < ApplicationRecord
  belongs_to :user, :foreign_key => "studentId"
end
