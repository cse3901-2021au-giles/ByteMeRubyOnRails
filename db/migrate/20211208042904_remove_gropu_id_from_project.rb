class RemoveGropuIdFromProject < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :project, :group_id
  end
end
