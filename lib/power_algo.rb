class PowerAlgo

  attr_writer :server_list, :cluster_manager
  
  def initialize
    @server_list = nil  # cluster.rb
    @execution_rate = 0
    @cluster_manager = nil # cluster_manager.rb
  end
  
  def rate_update(job_arrival_rate, execution_rate)
    if job_arrival_rate > execution_rate
      off_servers = @cluster_manager.get_off
    end
    
    
  end
  
  def server_on(server_id)
    @cluster_manager.server_on server_id
  end
  
  def server_off(server_id)
    @cluster_manager.server_off server_id
  end
  
end
