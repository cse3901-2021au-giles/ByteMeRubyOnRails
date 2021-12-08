class AddGroupIdToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :group_id, :integer
  end
end
