class RemoveStudenIdFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :Student_id, :bigint
  end
end
