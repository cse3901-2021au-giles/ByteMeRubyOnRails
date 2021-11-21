class CreateStudentXGroupRefs < ActiveRecord::Migration[6.0]
  def change
    create_table :student_x_group_refs do |t|
      t.integer :student_id
      t.integer :group_id

      t.timestamps
    end
  end
end
