class CreateCources < ActiveRecord::Migration[7.0]
  def change
    create_table :cources do |t|
      t.string :courceId
      t.string :courceName
      t.string :semester
      t.timestamps
    end
  end
end
