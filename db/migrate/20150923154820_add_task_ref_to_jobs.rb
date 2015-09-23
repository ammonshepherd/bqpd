class AddTaskRefToJobs < ActiveRecord::Migration
  def change
    add_reference :jobs, :task, index: true, foreign_key: true
  end
end
