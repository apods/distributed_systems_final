$LOAD_PATH << './lib'
require "read_servers"
require "job_list"

filename = "./server_profiles/" + (ARGV.first || "profile_1.ser")
filename2 = "./jobs/" + (ARGV[1] || "execution_1.job")
server_info = ServerList.new(filename)
job_list = JobList.new(filename2)

server_info.print_servers
job_list.print_jobs
