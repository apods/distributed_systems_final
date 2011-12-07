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
    
    @servers[0][4] = true        # The first server is set to run
    
    @cluster = nil
    
  end
  
  def execute_rate
    max = max_server
    add_array = Array.[]()
    @servers.each do |server|
      if server[4] == true
        add_array << max[3].to_f/server[3]
      end
    end
    su = 0
    for i in 0 .. add_array.length - 1
      su += add_array[i]
    end
    max[3].to_f/su
  end
  
  def max_server
    max = @servers[0]
    for i in 1 .. @servers.length - 1
      if @servers[i][2] > max[3] and @servers[i][4] == true
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
