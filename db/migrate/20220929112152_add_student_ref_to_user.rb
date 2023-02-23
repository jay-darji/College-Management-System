class AddStudentRefToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :User, null: false, foreign_key: true
  end
end
