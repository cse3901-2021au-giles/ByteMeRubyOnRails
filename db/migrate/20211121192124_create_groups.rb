class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :class_id
      t.integer :group_type

      t.timestamps
    end
  end
end
