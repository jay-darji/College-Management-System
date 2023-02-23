class Course < ApplicationRecord
  has_many :faculty_academic_information, :foreign_key => "courseId"
end
