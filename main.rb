# This is the main file that runs the simulator, any other Ruby files are
# organized in the lib folder in this directory

$LOAD_PATH << './lib'
require "read_servers"
require "job_list"

# Grab cluster profile and a list of jobs to execute
filename = "./server_profiles/" + (ARGV[0] || "profile_1.ser")
filename2 = "./jobs/" + (ARGV[1] || "execution_1.job")
server_info = ServerList.new(filename)
job_list = JobList.new(filename2)

# Simulate the arrival of jobs to the queue
job_list.execute
