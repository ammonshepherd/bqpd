class AddDefaultTaskToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :default_task_id, :integer
    add_foreign_key :projects, :tasks, column: :default_task_id
    add_index :projects, :default_task_id
  end
end
