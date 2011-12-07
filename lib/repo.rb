class Repo
  
  attr_reader :cluster, :job_list, :manager
  
  def initialize(cluster, job_list, manager)
    @cluster = cluster
    @job_list = job_list
    @manager = manager
  end
  
end
