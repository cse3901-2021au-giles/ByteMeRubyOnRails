class AddPfpColorsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :color1, :string
    add_column :users, :color2, :string
  end
end
