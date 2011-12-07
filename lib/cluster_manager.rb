class ClusterManager
  
  def initialize file
    # Read in the server profiles
    @servers = IO.readlines file
    
    # Cut out the headings in the input file
    @servers = @servers[1, @servers.length - 1]
    
    # Format each row of values into an array
    @servers.each_index do |i|
      
      @servers[i] = @servers[i].split
      for j in 0 .. @servers[i].length - 1
        @servers[i][j] = @servers[i][j].to_i
      end
    end
    
    @servers.each_index do |i|
      @servers[i] << false       # Cell 2 determines whether the server is running
    end
    
    @servers[0][2] = true        # The first server is set to run
    
    @cluster = nil
    
  end
  
  def execute_rate
    max = max_server
    add_array = Array.[]()
    @servers.each do |server|
      add_array << max[1]/server[1] unless server[2] == false
    end
    puts add_array
    add_array.inject(:+)/max[1]
  end
  
  def max_server
    max = @servers[0]
    for i in 1 .. @servers.length - 1
      if @servers[i][1] > max[1]
        max = @servers[i]
      end
    end
    
    max
  end
  
  def cluster= cluster
    @cluster = cluster
  end
  
  def print_servers
    puts "Server_ID\tOn_Delay(Sec)\tRun_Power_(Wh)\tJobs_Time_(Sec)"
    for i in 0 .. @servers.length - 1
      for j in 0 .. @servers[i].length - 1
        print @servers[i][j]
        print "\t\t"
      end
      puts "\n"
    end
  end

end
