class User < ApplicationRecord

  validates :firstName, presence:true
  validates :LastName, presence: true
  validates :email, presence: true, uniqueness: true

  has_secure_password

  validates :password, length: {in: 6..12}, confirmation: true, unless: Proc.new{|user| user.password.blank?}
  validates :password_confirmation, presence: true, unless: Proc.new{|user| user.password.blank?}
  validates :gender, presence: true
  validates :role, presence: true
  validates :mobileNo ,length: {is: 10}, unless: Proc.new{|user| user.mobileNo.blank?}
  validates :firstName, presence:true
  validates :LastName, presence: true


  has_one :student_academic_information, dependent: :destroy, foreign_key: "studentId"
  has_one :address, dependent: :destroy, foreign_key: "userId"
  has_one :parental_information, dependent: :destroy, foreign_key: "userId"
  #has_one :faculty_academic_information, dependent: :destroy, foreign_key: "facultyId"
  has_many :faculty_academic_information, dependent: :destroy,foreign_key: "facultyId"
end
