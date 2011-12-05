$LOAD_PATH << './lib'
require "read_servers"

filename = "./server_profiles/" + (ARGV.first || "profile_1.ser")
server_info = ServerList.new(filename)
