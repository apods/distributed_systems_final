class PowerAlgo
  
  def initialize(cm_server_profile, num_jobs)
    @cm_servers = cm_server_profile
    @num_jobs = num_jobs
    @rate = 0
    @last_arrival = Time.now
    @jobs = Queue.new
    @last_job_processed
  end
  
  def new_job(id)
    arrival_time = Time.now
    gap = arrival_time - @last_arrival
    @last_arrival = arrival_time
    
    @jobs << Array.[](id, gap, Time.now)
    @rate = average_arrival_rate
    if id == 1
      @last_job_processed = Time.now
    end
    
    check = Time.now
    if @cm_servers.consume_rate < check - @last_job_processed
      check.floor.times do
        completed = @jobs.pop
        puts "Finished serving job " + completed[0].to_s
      end
    end
  end
  
  def average_arrival_rate
    sum = 0
    @jobs.each do |job|
      sum += job[1]
    end
    sum/@jobs.length
  end
  
end
