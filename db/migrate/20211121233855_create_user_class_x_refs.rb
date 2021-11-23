class CreateUserClassXRefs < ActiveRecord::Migration[6.1]
  def change
    create_table :user_class_x_refs do |t|
      t.integer :user_id
      t.integer :class_id

      t.timestamps
    end
  end
end
