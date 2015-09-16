class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :projects, :jobs do |t|
      t.index :job_id
      t.index :project_id
    end
  end
end
