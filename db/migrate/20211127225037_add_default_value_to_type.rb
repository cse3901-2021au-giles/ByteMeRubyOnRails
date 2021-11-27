class AddDefaultValueToType < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :user_type, "student"
  end
end
