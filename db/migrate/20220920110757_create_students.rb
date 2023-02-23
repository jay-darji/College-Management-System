class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :firstName
      t.string :middleName
      t.string :LastName
      t.string :mobileNo
      t.bigint :studentId
      t.string :email
      t.float :cpi
      t.string :degree
      t.string :department

      t.timestamps
    end
  end
end
