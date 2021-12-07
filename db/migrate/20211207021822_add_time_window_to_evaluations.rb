class AddTimeWindowToEvaluations < ActiveRecord::Migration[6.1]
  def change
    add_column :evaluations, :access_opens, :datetime
    add_column :evaluations, :access_closes, :datetime
  end
end
