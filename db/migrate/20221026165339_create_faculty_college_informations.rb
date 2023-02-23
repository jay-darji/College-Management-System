class CreateFacultyCollegeInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :faculty_academic_informations do |t|
      t.string :batch

      t.timestamps
    end
  end
end
