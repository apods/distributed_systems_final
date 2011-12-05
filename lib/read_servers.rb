Class ServerList
  
  
  def initialize(file)
    # Read in the server profiles
    @servers = IO.readlines(file)
    
    # Cut out the headings in the input file
    @servers = @servers[1, @servers.length - 1]
    
    # Format each row of values into an array
    @servers.each_index |i| do
      
      @servers[i] = @servers[i].split
      for j in 0 .. @servers[i].length - 1
        @servers[i][j] = @servers[i][j].to_i
      end
    end
  end

end
