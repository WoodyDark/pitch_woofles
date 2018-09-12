set :output, "#{path}/log/cron.log"

every 1.minute do
  command "python #{path}/../feed.py"
  command "echo #{Time.now}"
end

every :sunday, at: '12pm' do
  runner "Task.do_something_great"
end
