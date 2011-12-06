require "thread"

class PowerAlgo
  
  def initialize(server_profile)
    @servers = server_profile
    @rate = 0
    @timer = Time.now
    @jobs = Queue.new
  end
  
  def new_job(id)
    arrival_time = Time.now
    gap = arrival_time - @timer
    @timer = arrival_time
    
    @jobs << Array.[](id, gap)
    @rate = average_arrival_rate
    complete_job
  end
  
  def average_arrival_rate
    sum = 0
    @jobs.each do |job|
      sum += job[1]
    end
    sum/@jobs.length
  end
  
  def complete_job
    sleep((@jobs.pop)[1])
    puts "job completed"
  end
  
end
