class AddSubmittedToEvaluations < ActiveRecord::Migration[6.1]
  def change
    add_column :evaluations, :submitted, :boolean, :default => false
  end
end
