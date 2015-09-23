class ChangeJobsAndTasks < ActiveRecord::Migration
  def change

    remove_column :jobs, :command, :string
    remove_column :jobs, :description, :string
    remove_column :jobs, :title, :string

    add_column :jobs, :task_name, :string
    add_column :jobs, :log, :string

    add_column :tasks, :command, :string

  end
end
