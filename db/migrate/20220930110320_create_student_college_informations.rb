class CreateStudentCollegeInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :student_academic_informations do |t|
      t.bigint :studenId
      t.integer :currentSemester
      t.float :cpi
      t.string :degree
      t.string :department

      t.timestamps
    end
  end
end
