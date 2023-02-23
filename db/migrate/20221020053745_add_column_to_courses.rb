class AddColumnToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :batch, :string, null: false
  end
end
