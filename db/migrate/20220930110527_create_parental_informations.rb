class CreateParentalInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :parental_informations do |t|
      t.bigint :studentId
      t.string :fatherName
      t.string :motherName
      t.bigint :fatherMobileNo
      t.bigint :motherMobileNo

      t.timestamps
    end
  end
end
