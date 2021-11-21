class CreateStudentXClassRefs < ActiveRecord::Migration[6.1]
  def change
    create_table :student_x_class_refs do |t|
      t.integer :student_id
      t.integer :class_id

      t.timestamps
    end
  end
end
