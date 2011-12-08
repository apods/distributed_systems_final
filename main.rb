# This is the main file that runs the simulator, any other Ruby files are
# organized in the lib folder in this directory

$LOAD_PATH << './lib'
require "thread"
require "cluster_manager"
require "job_list"
require "cluster"
require "power_algo"

# Grab cluster profile and a list of jobs to execute
filename = "./server_profiles/" + (ARGV[0] || "profile_1.ser")
filename2 = "./jobs/" + (ARGV[1] || "execution_1.job")

# Initialize classes
power_algo = PowerAlgo.new
cluster = ClusterManager.new filename
job_list = JobList.new filename2
manager = Cluster.new cluster, job_list.num_jobs, power_algo

cluster.cluster= manager
power_algo.server_list= cluster.servers


executor = Thread.new do
  manager.execute(ClusterManager.new(filename))
end


# Must go before execute method
job_list.power= manager


# Simulate the arrival of jobs to the queue
job_list.execute(Array.[](0))

executor.join

