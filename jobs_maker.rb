new_job_file = File.new("./jobs/" + ARGV.first, "w")

new_job_file.puts "Job_num\tdelay_(ms)"
for i in 0 .. 100
  new_job_file.puts "#{i+1}\t\t#{[*1 .. 150].choice}"
end




new_job_file.close
