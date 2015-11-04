class Project < ActiveRecord::Base

  has_many :tasks
  has_many :jobs, -> {order "created_at DESC"}, through: :tasks

  def default_task
    # if default_task_id = nil assign variable task_id to the first task associated to project
    # otherwise assign task_id to the default_task_id
    
    default_task_id.nil? ? tasks.first : default_task_id

    # if @project.default_task_id.nil? 
    #   task_id = @project.tasks.first
    # else
    #   task_id = @project.default_task_id
    # end
  end

  def friendly_id
    title.downcase.gsub(/\W+/, '-')
  end

  def has_tasks
    # if the project has tasks, return a not empty, if no tasks, return empty
    !tasks.empty?
  end

  def self.options_list
    Project.all.to_a.map! {|project| [project.title, project.id] }
  end

  def repo_exists
    @repo = friendly_id
    @repo_dir = Rails.root.join("tmp/repos/#{@repo}")
    
    if Dir.exist? @repo_dir
      system %{cd #{@repo_dir}; git pull}
    else
      system %{mkdir -p #{@repo_dir}; cd #{@repo_dir}; git clone -b #{branch} #{repo} . }
    end

    @repo_dir
  end

end
