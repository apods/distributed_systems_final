class PowerAlgo

  attr_writer :server_list, :cluster_manager
  
  def initialize
    @server_list = nil  # cluster.rb
    @execution_rate = 0
    @cluster_manager = nil # cluster_manager.rb
  end
  
  def rate_update(job_arrival_rate, execution_rate)
    if job_arrival_rate < execution_rate
      server_on(@cluster_manager.min_power[0])
    end
    if job_arrival_rate*1.5 > execution_rate
      server_off(@cluster_manager.max_power[0]) unless @cluster_manager.only @cluster_manager.max_power[0]
    end
  end
  
  def server_on(server_id)
    puts "Cluster overwhelmed: Turn on server #{server_id}"
    temp = Thread.new do
      time = @cluster_manager.time_on server_id
      #sleep(time/1000)
      @cluster_manager.server_on server_id
    end
  end
  
  def server_off(server_id)
    puts "Cluster inefficient: Turn off server #{server_id}"
    @cluster_manager.server_off server_id
  end
  
end
