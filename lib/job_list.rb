class JobList
  
  
  def initialize(file)
    # Read in the server profiles
    @jobs = IO.readlines(file)
    
    # Cut out the headings in the input file
    @jobs = @jobs[1, @jobs.length - 1]
    
    # Format each row of values into an array
    @jobs.each_index do |i|
      
      @jobs[i] = @jobs[i].split
      for j in 0 .. @jobs[i].length - 1
        @jobs[i][j] = @jobs[i][j].to_i
      end
      
    end
  end
  
  
  def print_jobs
    puts "Job_num\t\tTime(ms)"
    for i in 0 .. @jobs.length - 1
      for j in 0 .. @jobs[i].length - 1
        print @jobs[i][j]
        print "\t\t"
      end
      puts "\n"
    end
  end
  
  def execute(queue)
    
  end

end
