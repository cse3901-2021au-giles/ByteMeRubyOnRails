class CreateEvaluations < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluations do |t|
      t.integer :evaluator_id
      t.integer :evaluatee_id
      t.integer :score
      t.text :assessment
      t.integer :project_id
      t.integer :group_id

      t.timestamps
    end
  end
end
