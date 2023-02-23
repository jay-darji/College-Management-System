class RemoveColumnsFromStudents < ActiveRecord::Migration[7.0]
  def change
    remove_column :students, :cpi, :float
    remove_column :students, :degree, :string
    remove_column :students, :department, :string
  end
end
