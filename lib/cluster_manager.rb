class ClusterManager

  attr_reader :servers
  
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
  
  def execute_rate2 servers
    max = max_server2 servers
    add_array = Array.[]()
    servers.each do |server|
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
  
  def server_on(id)
    @servers[id-1][4] = true
  end
  
  def server_off(id)
    @servers[id-1][4] = false
  end
  
  def max_server
    max = @servers[0]
    for i in 1 .. @servers.length - 1
      if @servers[i][3] > max[3] and @servers[i][4] == true
        max = @servers[i]
      end
    end
    max
  end
  
  def max_server2 servers
    max = servers[0]
    for i in 1 .. servers.length - 1
      if servers[i][2] > max[3] and servers[i][4] == true
        max = servers[i]
      end
    end
    max
  end
  
  def cluster= cluster
    @cluster = cluster
  end
  
  def get_off
    @servers.collect { |server| server unless server[4] == true }.compact
  end
  
  def get_on
    @servers.collect { |server| server unless server[4] == false }.compact
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
  
  def time_on id
    @servers[id][1]
  end
  
  def min_power
    min = @servers[0]
    for i in 1 .. @servers.length - 1
      if @servers[i][2] > min[2] and @servers[i][4] == false
        min = @servers[i]
      end
    end
    min
  end
  
  def max_power
    max = @servers[0]
    for i in 1 .. @servers.length - 1
      if @servers[i][2] > max[2] and @servers[i][4] == true
        max = @servers[i]
      end
    end
    max
  end
  
  def only server_id
    @servers.each do |server|
      if server[0] != server_id and server[4] == true
        false
      end
    end
    true
  end

end
