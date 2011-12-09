class PowerAlgo

  attr_writer :server_list, :cluster_manager
  
  def initialize
    @server_list = nil
    @execution_rate = 0
    @cluster_manager = nil
  end
  
  def rate_update(job_arrival_rate, execution_rate)
    if job_arrival_rate > execution_rate
      server_on(@cluster_manager.min_power[0])
    end
  end
  
  def server_on(server_id)
    puts "Cluster overwhelmed: Turn on server #{server_id}"
    temp = Thread.new do
      sleep(@cluster_manager.time_on)
      @cluster_manager.server_on server_id
    end
    temp.join
  end
  
  def server_off(server_id)
    @cluster_manager.server_off server_id
  end
  
end
