class AddColumnsToStudents < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :password, :string
    add_column :students, :password_confirmation, :string
  end
end
