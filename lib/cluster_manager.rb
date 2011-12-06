class ClusterManager
  
  def initialize(file)
    # Read in the server profiles
    @servers = IO.readlines(file)
    
    # Cut out the headings in the input file
    @servers = @servers[1, @servers.length - 1]
    
    # Format each row of values into an array
    @servers.each_index do |i|
      
      @servers[i] = @servers[i].split
      for j in 0 .. @servers[i].length - 1
        @servers[i][j] = @servers[i][j].to_i
      end
      
    end
  end
  
  def consume_rate
    2
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
