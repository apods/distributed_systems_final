class PowerAlgo

  attr_writer :server_list, :cluster_manager
  
  def initialize
    @server_list = nil
    @execution_rate = 0
    @cluster_manager = nil
  end
  
  def rate_update(job_arrival_rate, execution_rate)
    #implement
  end
  
  def server_on(server_id)
    @cluster_manager.server_on server_id
  end
  
  def server_off(server_id)
    @cluster_manager.server_off server_id
  end
  
end
