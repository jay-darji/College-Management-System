class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :mobileNo, :bigint
  end
end
