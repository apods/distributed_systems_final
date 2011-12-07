require 'thread'

class Cluster
  
  def initialize(cm_server_profile, num_jobs)
    @cm_servers = cm_server_profile   # object holding server information
    @num_jobs = num_jobs              # the total number of jobs read in
    @rate = 0                         # current rate of jobs entering system
    @last_arrival = Time.now          # the last time a job has arrived into the system
    @jobs = Queue.new                 # the simulated queue of jobs
    @last_job_processed = Time.now    # time that the last job was removed
  end
  
  def new_job(id)                     # this method is called by the job manager
    arrival_time = Time.now
    gap = arrival_time - @last_arrival
    @last_arrival = arrival_time
    
    @jobs << Array.[](id, gap, Time.now)
    @rate = average_arrival_rate
    puts "Rate: #{@rate}"
    if id == 1
      @last_job_processed = Time.now
    end
    
    if nil
        puts "skip"
        check = (Time.now - @last_job_processed).to_i
        if @cm_servers.consume_rate < check
          check.floor.times do
            completed = @jobs.pop
            @last_job_processed = Time.now
            puts "Finished serving job " + completed[0].to_s
          end
        end
    end
  end
  
  def execute
    @num_jobs.times do
      sleep(@cm_servers.execute_rate)
      jorb = @jobs.pop
      puts "Job #{jorb[0]} completed!"
    end
  end
  
  def send
    "MESSAGE!"
  end
  
  def average_arrival_rate          # calculate the rate of jobs entering system
    sum = 0
    temparr = Array.[]()
    @jobs.length.times do
      temparr << @jobs.pop
      sum += temparr[temparr.length - 1][1]
    end
    temparr.each do |jorb|
      @jobs << jorb
    end
    return sum/@jobs.length unless @jobs.length == 0
    0
  end
  
end
